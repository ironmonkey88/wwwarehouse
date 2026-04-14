{{ config(
    materialized='table',
    tags=['dashboard']
) }}

WITH monthly_grain AS (
    SELECT
        date_trunc('month', created_at) AS month_start,
        ward_id,
        request_type,
        COUNT(service_request_id) AS incoming_count,
        -- Backlog logic: Count of requests created before this month that remained open at month start
        -- (This is a simplified proxy for carryover in this re-derivation)
        COUNT(CASE WHEN closed_at IS NULL OR closed_at >= date_trunc('month', created_at) THEN 1 END) AS active_count
    FROM {{ ref('stg_311_requests') }}
    GROUP BY 1, 2, 3
),

performance_metrics AS (
    SELECT
        *,
        LAG(incoming_count) OVER (PARTITION BY ward_id, request_type ORDER BY month_start) AS prev_incoming_count,
        -- Carryover: Active requests from previous month (proxy)
        LAG(active_count) OVER (PARTITION BY ward_id, request_type ORDER BY month_start) AS carryover_count
    FROM monthly_grain
)

SELECT
    month_start,
    ward_id,
    request_type,
    incoming_count,
    COALESCE(carryover_count, 0) AS carryover_count,
    CASE 
        WHEN prev_incoming_count > 0 
        THEN (incoming_count - prev_incoming_count) / CAST(prev_incoming_count AS FLOAT)
        ELSE NULL 
    END AS mom_demand_change
FROM performance_metrics
