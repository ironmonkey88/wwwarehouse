{{ config(
    pre_hook=[
        "INSTALL httpfs",
        "LOAD httpfs",
        "SET s3_endpoint = 'storage.googleapis.com'",
        "SET s3_access_key_id = '" ~ env_var('GCS_ACCESS_KEY_ID', '') ~ "'",
        "SET s3_secret_access_key = '" ~ env_var('GCS_SECRET_ACCESS_KEY', '') ~ "'",
        "SET s3_region = 'auto'"
    ]
) }}

WITH source_data AS (
    SELECT * FROM read_json_auto('{{ var("warehouse_path") }}/bronze/councilors/*.jsonl.gz')
)

SELECT
    _dlt_id AS councilor_id,
    name AS councilor_name,
    ward AS councilor_ward,
    CURRENT_TIMESTAMP AS processed_at
FROM source_data
