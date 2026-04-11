-- [SIMULATED] Ward Boundaries and Demographics
SELECT 
    'Ward 1' AS ward_id,
    75000 AS median_income,
    'North' AS sector
UNION ALL
SELECT 
    'Ward 2' AS ward_id,
    62000 AS median_income,
    'East' AS sector
EOF && \
cat << 'EOF' > transformation/dbt/models/silver/int_refiner_drill_joined.sql
-- [SIMULATED] Joining 311 tickets to Ward demographies
SELECT 
    t.service_request_id,
    w.median_income AS ward_median_income
FROM {{ ref('stg_311_requests') }} t
LEFT JOIN {{ ref('dim_refiner_drill_wards') }} w
    ON t.ward = w.ward_id
EOF && \
cat << 'EOF' > transformation/dbt/models/gold/fct_refiner_drill_demographics.sql
-- [SIMULATED] Final Fact Table for Oxygen Semantic Layer
{{ config(
    materialized='table',
    tags=['oxygen:semantic']
) }}

SELECT 
    service_request_id,
    ward_median_income,
    CURRENT_TIMESTAMP() AS processed_at
FROM {{ ref('int_refiner_drill_joined') }}
