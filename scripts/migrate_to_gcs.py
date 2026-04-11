#!/usr/bin/env python3
import os
import duckdb
from dotenv import load_dotenv

def migrate_to_parquet():
    load_dotenv()
    
    local_db = "./.ignored/warehouse_local.duckdb"
    bucket = "warehouse-011793-factory"
    
    gcs_id = os.getenv("GCS_ACCESS_KEY_ID")
    gcs_key = os.getenv("GCS_SECRET_ACCESS_KEY")
    
    if not gcs_id or not gcs_key:
        print("❌ GCS credentials missing in .env")
        return

    print(f"🚀 Initializing Lakehouse Polarization (Parquet Mode) for {local_db}...")
    
    conn = duckdb.connect(local_db)
    conn.execute("INSTALL httpfs; LOAD httpfs;")
    conn.execute(f"SET s3_endpoint = 'storage.googleapis.com';")
    conn.execute(f"SET s3_access_key_id = '{gcs_id}';")
    conn.execute(f"SET s3_secret_access_key = '{gcs_key}';")
    conn.execute(f"SET s3_region = 'auto';")
    conn.execute("SET s3_url_style = 'path';")

    # Tables to migrate
    tables = ["service_requests"]
    
    for table in tables:
        # We use Parquet for better Lakehouse interoperability and remote performance
        gcs_path = f"s3://{bucket}/bronze/{table}.parquet"
        print(f"📦 Migrating {table} to {gcs_path}...")
        
        # 1. Export directly to GCS Parquet
        conn.execute(f"COPY (SELECT * FROM bronze.{table}) TO '{gcs_path}' (FORMAT PARQUET);")
        
        # verification
        count = conn.execute(f"SELECT count(*) FROM read_parquet('{gcs_path}')").fetchone()[0]
        print(f"✅ Successfully migrated {count} records to GCS Parquet.")

    conn.close()
    print("🎖️ Migration Complete. 311 Dataset is now Sovereign in the Lakehouse (Parquet).")

if __name__ == "__main__":
    migrate_to_parquet()
