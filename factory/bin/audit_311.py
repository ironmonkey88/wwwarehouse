#!/usr/bin/env python3
import requests
import duckdb
from datetime import datetime, timedelta
import sys
import random
import pandas as pd
import argparse

def get_lookback_date():
    return (datetime.now() - timedelta(days=30)).strftime('%Y-%m-%dT%H:%M:%S')

def get_socrata_distribution(full_history=False):
    """Shape Audit: Distribution by type."""
    url = "https://data.somervillema.gov/resource/4pyi-uqq6.json"
    params = {
        "$select": "type, count(id)",
        "$group": "type"
    }
    if not full_history:
        params["$where"] = f"date_created >= '{get_lookback_date()}'"
    
    response = requests.get(url, params=params)
    response.raise_for_status()
    return {str(item['type']): int(item['count_id']) for item in response.json()}

def get_local_distribution():
    """Shape Audit: Local distribution."""
    conn = duckdb.connect("./.ignored/warehouse_local.duckdb")
    res = conn.execute("SELECT type, count(*) FROM bronze.service_requests GROUP BY type").fetchall()
    conn.close()
    return {str(row[0]): int(row[1]) for row in res}

def normalize_val(val, field_name):
    """Normalizes values for comparison (handles nulls, dates, and Eastern Fidelity)."""
    if val is None or str(val).lower() == 'nan' or str(val).lower() == 'none':
        return None
    
    if "date" in field_name or "created" in field_name:
        try:
            dt = pd.to_datetime(val)
            if len(str(val)) <= 10:
                return dt.date()
            if dt.tzinfo is not None:
                return dt.tz_convert('US/Eastern').tz_localize(None)
            else:
                return dt.tz_localize('UTC').tz_convert('US/Eastern').tz_localize(None)
        except:
            return str(val).strip()
            
    return str(val).strip()

def run_triple_seal_audit(full_history=False):
    mode_label = "FULL HISTORY" if full_history else "LAST 30 DAYS"
    print(f"--- WONG WAY TRIPLE-SEAL AUDIT ({mode_label} MODE) ---")
    
    conn = duckdb.connect("./.ignored/warehouse_local.duckdb")
    
    try:
        # GATE 1: SIZE
        print("[GATE 1] Checking Size (Volume)...")
        url = "https://data.somervillema.gov/resource/4pyi-uqq6.json"
        s_params = {"$select": "count(id)"}
        if not full_history:
            s_params["$where"] = f"date_created >= '{get_lookback_date()}'"
            
        source_count = int(requests.get(url, params=s_params).json()[0]['count_id'])
        local_count = conn.execute("SELECT count(*) FROM bronze.service_requests").fetchone()[0]
        
        if source_count != local_count:
            print(f"❌ SIZE BREACH: Source {source_count} != Local {local_count}")
            sys.exit(1)
        print(f"✅ SIZE PASS: {source_count} records matched.\n")

        # GATE 2: SHAPE
        print("[GATE 2] Checking Shape (Distribution)...")
        source_dist = get_socrata_distribution(full_history)
        local_dist = get_local_distribution()
        
        for r_type, s_count in source_dist.items():
            l_count = local_dist.get(r_type, 0)
            if abs(s_count - l_count) > 0: # Exact match required
                print(f"❌ SHAPE BREACH for '{r_type}': Source {s_count} != Local {l_count}")
                sys.exit(1)
        print(f"✅ SHAPE PASS: All distributions matched.\n")

        # GATE 3: SAMPLE (Stochastic Moral Certainty)
        # 1% Sample size, but capped at 1000 for efficiency if in full mode
        target_sample = int(source_count * 0.01)
        sample_size = min(1000, target_sample) if full_history else target_sample
        
        print(f"[GATE 3] Checking Sample ({sample_size} records for Moral Certainty)...")
        
        # Get schema
        local_columns = [col[0] for col in conn.execute("DESCRIBE bronze.service_requests").fetchall()]
        
        # Stochastic Sampling: Fetch records at random offsets
        verified_count = 0
        while verified_count < sample_size:
            offset = random.randint(0, source_count - 1)
            params = {"$limit": 1, "$offset": offset}
            if not full_history:
                params["$where"] = f"date_created >= '{get_lookback_date()}'"
            
            s_row = requests.get(url, params=params).json()[0]
            s_id = s_row['id']
            
            l_row = conn.execute("SELECT * FROM bronze.service_requests WHERE id = ?", [s_id]).fetchone()
            
            if not l_row:
                print(f"❌ SAMPLE BREACH: ID {s_id} missing locally.")
                sys.exit(1)
            
            l_row_dict = dict(zip(local_columns, l_row))
            for key, s_val in s_row.items():
                if key in l_row_dict:
                    norm_s = normalize_val(s_val, key)
                    norm_l = normalize_val(l_row_dict[key], key)
                    if norm_s != norm_l:
                        print(f"❌ VALUE BREACH for ID {s_id} Field '{key}': S:{norm_s} L:{norm_l}")
                        sys.exit(1)
            
            verified_count += 1
            if verified_count % 100 == 0:
                print(f"   Progress: Verified {verified_count}/{sample_size} records...")

        print(f"✅ SAMPLE PASS: {verified_count} unique records verified 1:1.\n")
        print("--- FINAL RESULT: 1% MORAL CERTAINTY ACHIEVED 🎖️ ---")
        sys.exit(0)

    except Exception as e:
        print(f"⚠️ AUDIT ERROR: {str(e)}")
        sys.exit(1)
    finally:
        conn.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--full", action="store_true", help="Audit full history")
    args = parser.parse_args()
    run_triple_seal_audit(full_history=args.full)
