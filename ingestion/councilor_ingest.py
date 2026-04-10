import dlt
import json
import os

def load_councilors():
    # 1. Initialize the dlt pipeline with the Filesystem (GCS) destination
    pipeline = dlt.pipeline(
        pipeline_name='councilor_info',
        destination='filesystem',
        dataset_name='bronze'
    )

    # 2. Read the official 2026 JSON data
    with open('ingestion/councilors_2026_raw.json', 'r') as f:
        data = json.load(f)

    # 3. Load the data into the 'councilors' table (REPLACE strategy for snapshot)
    info = pipeline.run(
        data, 
        table_name="councilors",
        write_disposition="replace"
    )
    
    print(info)

if __name__ == "__main__":
    # Configure Filesystem (GCS) Destination Credentials
    os.environ['DESTINATION__FILESYSTEM__BUCKET_URL'] = 'gs://warehouse-011793-factory'
    os.environ['DESTINATION__FILESYSTEM__CREDENTIALS__PROJECT_ID'] = 'gen-lang-client-0117935224'
    os.environ['DESTINATION__FILESYSTEM__LOADER_FILE_FORMAT'] = 'parquet'
    
    load_councilors()
