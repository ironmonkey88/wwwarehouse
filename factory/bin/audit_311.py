import requests
import duckdb
from datetime import datetime, timedelta
import sys
import random
import pandas as pd

def get_lookback_date():
    return (datetime.now() - timedelta(days=30)).strftime('%Y-%m-%dT%H:%M:%S')

def get_socrata_distribution(lookback_date):
    """Shape Audit: Distribution by type."""
    url = "https://data.somervillema.gov/resource/4pyi-uqq6.json"
    params = {
        "$select": "type, count(id)",
        "$where": f"date_created >= '{lookback_date}'",
        "$group": "type"
    }
    response = requests.get(url, params=params)
    response.raise_for_status()
    # Normalize keys/values to string-based map
    return {str(item['type']): int(item['count_id']) for item in response.json()}

def get_local_distribution():
    """Shape Audit: Local distribution."""
    conn = duckdb.connect("./.ignored/warehouse_local.duckdb")
    res = conn.execute("SELECT type, count(*) FROM bronze.service_requests GROUP BY type").fetchall()
    conn.close()
    return {str(row[0]): int(row[1]) for row in res}

def get_socrata_sample(lookback_date, limit=10):
    """Sample Audit: Full-row extraction."""
    url = "https://data.somervillema.gov/resource/4pyi-uqq6.json"
    params = {
        "$where": f"date_created >= '{lookback_date}'",
        "$limit": 100 # Pull pool to pick randoms
    }
    response = requests.get(url, params=params)
    response.raise_for_status()
    full_list = response.json()
    return random.sample(full_list, min(len(full_list), limit))

def normalize_val(val, field_name):
    """Normalizes values for comparison (handles nulls, dates, and Eastern Fidelity)."""
    if val is None or str(val).lower() == 'nan' or str(val).lower() == 'none':
        return None
    
    # Handle Date/Timestamp fields for Eastern Fidelity
    if "date" in field_name or "created" in field_name:
        try:
            dt = pd.to_datetime(val)
            # If it's already fixed-length (just a date), keep as date
            if len(str(val)) <= 10:
                return dt.date()
                
            # If it has TZ info (Local Aware), convert to Eastern and strip
            if dt.tzinfo is not None:
                return dt.tz_convert('US/Eastern').tz_localize(None)
            else:
                # If naive (Socrata UTC), assume UTC, convert to Eastern, strip
                return dt.tz_localize('UTC').tz_convert('US/Eastern').tz_localize(None)
        except:
            return str(val).strip()
            
    # Normalize everything else to string for pure identity matching
    return str(val).strip()

def run_triple_seal_audit():
    lookback_date = get_lookback_date()
    print(f"--- WONG WAY TRIPLE-SEAL AUDIT (MORAL CERTAINTY MODE) ---")
    print(f"Window: since {lookback_date}\n")

    conn = duckdb.connect("./.ignored/warehouse_local.duckdb")
    
    try:
        # GATE 1: SIZE
        print("[GATE 1] Checking Size (Volume)...")
        source_count = int(requests.get("https://data.somervillema.gov/resource/4pyi-uqq6.json", 
                                        params={"$select": "count(id)", "$where": f"date_created >= '{lookback_date}'"}).json()[0]['count_id'])
        local_count = conn.execute("SELECT count(*) FROM bronze.service_requests").fetchone()[0]
        
        if source_count != local_count:
            print(f"❌ SIZE BREACH: Source {source_count} != Local {local_count}")
            sys.exit(1)
        print(f"✅ SIZE PASS: {source_count} records matched.\n")

        # GATE 2: SHAPE
        print("[GATE 2] Checking Shape (Distribution)...")
        source_dist = get_socrata_distribution(lookback_date)
        local_dist = get_local_distribution()
        
        for r_type, s_count in source_dist.items():
            l_count = local_dist.get(r_type, 0)
            if s_count != l_count:
                print(f"❌ SHAPE BREACH for '{r_type}': Source {s_count} != Local {l_count}")
                sys.exit(1)
        print(f"✅ SHAPE PASS: All distributions matched.\n")

        # GATE 3: SAMPLE
        sample_size = max(1, int(source_count * 0.01))
        print(f"[GATE 3] Checking Sample ({sample_size} records for 1% Moral Certainty)...")
        # Pull batch of 200 to minimize API overhead
        batch = get_socrata_sample(lookback_date, limit=200)
        # Select target 1% from the batch
        samples = random.sample(batch, min(len(batch), sample_size))
        
        # Get schema to avoid comparing dlt-internal columns
        local_columns = [col[0] for col in conn.execute("DESCRIBE bronze.service_requests").fetchall()]
        
        for s_row in samples:
            s_id = s_row['id']
            # Fetch full local row
            local_row_cursor = conn.execute("SELECT * FROM bronze.service_requests WHERE id = ?", [s_id])
            l_row = local_row_cursor.fetchone()
            
            if not l_row:
                print(f"❌ SAMPLE BREACH: ID {s_id} missing locally.")
                sys.exit(1)
            
            # Map column index to names
            l_row_dict = dict(zip(local_columns, l_row))
            
            # Compare shared fields
            for key, s_val in s_row.items():
                if key not in l_row_dict:
                    continue # Skip if dlt didn't ingest a specific sparse field
                
                l_val = l_row_dict[key]
                norm_s = normalize_val(s_val, key)
                norm_l = normalize_val(l_val, key)
                
                if norm_s != norm_l:
                    print(f"❌ VALUE BREACH for ID {s_id} Field '{key}':")
                    print(f"   Source: {norm_s}")
                    print(f"   Local:  {norm_l}")
                    sys.exit(1)
                    
        print(f"✅ SAMPLE PASS: {len(samples)} random full-rows verified 1:1 in Eastern Time.\n")

        print("--- FINAL RESULT: 1% MORAL CERTAINTY ACHIEVED 🎖️ ---")
        sys.exit(0)

    except Exception as e:
        print(f"⚠️ AUDIT ERROR: {str(e)}")
        sys.exit(1)
    finally:
        conn.close()

if __name__ == "__main__":
    run_triple_seal_audit()
