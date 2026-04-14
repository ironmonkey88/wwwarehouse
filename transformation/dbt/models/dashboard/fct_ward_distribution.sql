{{ config(
    materialized='table',
    tags=['dashboard', 'gold']
) }}

WITH source AS (
    SELECT * FROM {{ ref('stg_311_requests') }}
)

SELECT
    request_ward AS ward,
    count(*) AS ward_count,
    CURRENT_TIMESTAMP AS refinery_processed_at
FROM source
GROUP BY 1
