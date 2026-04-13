{{ config(
    materialized='table',
    tags=['gold', 'accountability']
) }}

WITH tickets AS (
    SELECT * FROM {{ ref('stg_311_requests') }}
),

councilors AS (
    SELECT * FROM {{ ref('slv_councilors') }}
    WHERE ward_id > 0 -- Focus on Ward-specific Councilors
)

SELECT
    t.service_request_id,
    t.created_at,
    t.closed_at,
    t.request_type,
    t.request_status,
    t.hours_to_close,
    c.councilor_name,
    c.councilor_role,
    t.ward_id,
    -- Accountability Metric: Flag if ticket is 'Overdue' (e.g., > 1 week)
    CASE 
        WHEN t.hours_to_close > 168 THEN TRUE 
        ELSE FALSE 
    END AS is_overdue,
    CURRENT_TIMESTAMP AS refinery_processed_at
FROM tickets t
INNER JOIN councilors c
    ON t.ward_id = c.ward_id
