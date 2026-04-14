{{ config(
    materialized='table',
    tags=['dashboard', 'gold']
) }}

WITH source AS (
    SELECT * FROM {{ ref('stg_311_requests') }}
)

SELECT
    CAST(created_at AS DATE) AS request_date,
    count(*) AS daily_count,
    CURRENT_TIMESTAMP AS refinery_processed_at
FROM source
GROUP BY 1
ORDER BY 1 DESC
