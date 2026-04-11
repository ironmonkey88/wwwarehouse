#!/usr/bin/env python3
import os
import sys
from dbt.cli.main import dbtRunner
from dotenv import load_dotenv

def run():
    load_dotenv()
    print("🚀 Sovereign Refinery: Initiating Lakehouse Handshake...")
    
    # Check for credentials in environment (provided by Secret Manager in Cloud Run)
    if not os.getenv("GCS_ACCESS_KEY_ID") or not os.getenv("GCS_SECRET_ACCESS_KEY"):
        print("⚠️ Warning: GCS credentials not found in environment. Local ADC will be attempted.")

    dbt = dbtRunner()
    
    # Default selection: everything related to 311 profiling
    # But allow overriding via command line
    target_models = sys.argv[1:] if len(sys.argv) > 1 else ["stg_311_requests+", "profile_stg_311_requests"]
    
    cli_args = [
        "build", # build handles both run and test in one go
        "--project-dir", "transformation/dbt",
        "--profiles-dir", "transformation/dbt",
        "--select"
    ] + target_models

    print(f"🎬 Executing: dbt {' '.join(cli_args)}")
    
    res = dbt.invoke(cli_args)
    
    if not res.success:
        print("❌ Refinery Failure.")
        if res.exception:
            print(f"Exception: {res.exception}")
        sys.exit(1)
    else:
        print("✅ Refinery success. Lakehouse polarized.")
        sys.exit(0)

if __name__ == "__main__":
    run()
