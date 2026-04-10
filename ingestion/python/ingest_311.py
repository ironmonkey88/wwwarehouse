import dlt
import requests
from datetime import datetime, timedelta

def fetch_311_service_requests():
    """
    Fetches the last 30 days of 311 Service Requests from Somerville Open Data.
    Target: 4pyi-uqq6
    """
    # Calculate the 30-day window
    lookback_date = (datetime.now() - timedelta(days=30)).strftime('%Y-%m-%dT%H:%M:%S')
    
    url = "https://data.somervillema.gov/resource/4pyi-uqq6.json"
    params = {
        "$where": f"date_created >= '{lookback_date}'",
        "$limit": 20000
    }
    
    response = requests.get(url, params=params)
    response.raise_for_status()
    
    data = response.json()
    print(f"Sovereign Extraction: Retrieved {len(data)} records starting from {lookback_date}")
    return data

def run_ingestion():
    """
    Runs the dlt pipeline to load 311 data into the local DuckDB refinery.
    """
    # Initialize the pipeline
    pipeline = dlt.pipeline(
        pipeline_name="somerville_311_refinery",
        destination=dlt.destinations.duckdb("./.ignored/warehouse_local.duckdb"),
        dataset_name="bronze"
    )

    # Fetch and load
    data = fetch_311_service_requests()
    info = pipeline.run(data, table_name="service_requests", write_disposition="replace")
    
    print(f"Refinery Update: {info}")

if __name__ == "__main__":
    run_ingestion()
