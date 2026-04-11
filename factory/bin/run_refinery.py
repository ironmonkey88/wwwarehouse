import os
import duckdb
from dbt.cli.main import dbtRunner

def run():
    print("🚀 Starting Sovereign Refinery Handshake...")
    
    # 1. Initialize dbt Runner
    dbt = dbtRunner()
    
    # 2. Prepare the DuckDB-GCS setup SQL
    # We use interoperability keys if available, or try ADC
    setup_sql = """
    INSTALL httpfs;
    LOAD httpfs;
    SET s3_endpoint = 'storage.googleapis.com';
    """
    
    # 3. Trigger dbt run
    # dbt-duckdb handles the connection, but we can pass vars
    cli_args = [
        "run",
        "--project-dir", "transformation/dbt",
        "--profiles-dir", "transformation/dbt",
        "--vars", f"{{warehouse_path: '{os.getenv('WAREHOUSE_PATH', 'gs://warehouse-011793-factory')}'}}"
    ]
    
    res = dbt.invoke(cli_args)
    
    if not res.success:
        print("❌ Refinery failed.")
        if res.exception:
            print(f"Exception: {res.exception}")
    else:
        print("✅ Refinery complete.")

if __name__ == "__main__":
    run()
