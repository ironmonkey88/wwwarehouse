import dlt
import requests
import time
from datetime import datetime

def fetch_311_full_history(dataset_id="4pyi-uqq6"):
    """
    Generator that fetches the entire history of 311 Service Requests using pagination.
    Socrata default limit is 50,000 per request.
    """
    url = f"https://data.somervillema.gov/resource/{dataset_id}.json"
    limit = 50000
    offset = 0
    total_fetched = 0
    
    print(f"Sovereign Extraction: Initiating full bulk load for {dataset_id}...")

    while True:
        params = {
            "$limit": limit,
            "$offset": offset,
            "$order": ":id" # Ordering by system ID for stable pagination
        }
        
        response = requests.get(url, params=params)
        response.raise_for_status()
        
        data = response.json()
        if not data:
            break
            
        yield data
        
        total_fetched += len(data)
        print(f"Progress: Retrieved {total_fetched} records...")
        
        # Small delay to respect Socrata API and prevent throttling
        time.sleep(0.5)
        offset += limit

def run_bulk_ingestion():
    """
    Runs the dlt pipeline for a full 'Truncate & Load' of the 311 dataset.
    """
    # Initialize the pipeline
    pipeline = dlt.pipeline(
        pipeline_name="somerville_311_refinery",
        destination=dlt.destinations.duckdb("./.ignored/warehouse_local.duckdb"),
        dataset_name="bronze"
    )

    # Execute load with 'replace' (Truncate and Load) for the initial bulk set
    # dlt handles generators natively by streaming chunks to the destination
    info = pipeline.run(
        fetch_311_full_history(), 
        table_name="service_requests", 
        write_disposition="replace"
    )
    
    print(f"Refinery Full Load Complete: {info}")

if __name__ == "__main__":
    run_bulk_ingestion()
