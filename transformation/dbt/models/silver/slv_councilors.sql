{{ config(
    materialized='view'
) }}

WITH raw_councilors AS (
    -- Reading from the Local JSONL pulled from GCS Assembler
    -- This follows the 'Zero-Idle' local-first pattern for strike missions.
    SELECT * FROM read_json_auto('data/councilors.jsonl.gz')
)

SELECT
    name AS councilor_name,
    role AS councilor_role,
    ward AS raw_ward,
    -- Standardizing Ward ID (Extracting number)
    CASE 
        WHEN ward LIKE 'Ward %' THEN CAST(REPLACE(ward, 'Ward ', '') AS INTEGER)
        WHEN ward = 'At-Large' THEN 0
        ELSE NULL
    END AS ward_id,
    CURRENT_TIMESTAMP AS refinery_processed_at
FROM raw_councilors
