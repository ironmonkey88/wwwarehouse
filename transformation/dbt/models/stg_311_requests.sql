{{ config(
    materialized='view'
) }}

WITH raw_data AS (
    SELECT * FROM {{ source('bronze', 'service_requests') }}
)

SELECT
    id AS service_request_id,
    -- Standardize to Eastern Time and cast to naive TIMESTAMP (NZ)
    CAST((CAST(date_created AS TIMESTAMPTZ) AT TIME ZONE 'US/Eastern') AS TIMESTAMP) AS created_at,
    CAST((CAST(most_recent_status_date AS TIMESTAMPTZ) AT TIME ZONE 'US/Eastern') AS TIMESTAMP) AS closed_at,
    type AS request_type,
    issue_description,
    most_recent_status AS request_status,
    ward AS request_ward,
    street_address,
    -- Calculate duration between naive timestamps
    CASE 
        WHEN most_recent_status = 'Closed'
        THEN date_diff('hour', 
                       CAST((CAST(date_created AS TIMESTAMPTZ) AT TIME ZONE 'US/Eastern') AS TIMESTAMP), 
                       CAST((CAST(most_recent_status_date AS TIMESTAMPTZ) AT TIME ZONE 'US/Eastern') AS TIMESTAMP))
        ELSE NULL 
    END AS hours_to_close,
    CURRENT_TIMESTAMP AS refinery_processed_at
FROM raw_data
