import dlt
import json
import os

def load_councilors():
    # 1. Initialize the dlt pipeline with a local DuckDB destination
    pipeline = dlt.pipeline(
        pipeline_name='councilor_info',
        destination='duckdb',
        dataset_name='bronze'
    )

    # 2. Read the raw JSON data
    with open('ingestion/councilors_raw.json', 'r') as f:
        data = json.load(f)

    # 3. Load the data into the 'councilors' table
    info = pipeline.run(data, table_name="councilors")
    
    print(info)

if __name__ == "__main__":
    # Ensure we use a local DB file for the trivial solve
    os.environ['DESTINATION__DUCKDB__CREDENTIALS'] = 'warehouse_local.duckdb'
    load_councilors()
