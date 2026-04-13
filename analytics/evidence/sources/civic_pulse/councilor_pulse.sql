-- [ARTISAN] Registering the Gold Councilor Pulse fact table
-- This source points to the local DuckDB refinery output
SELECT
    service_request_id,
    created_at,
    closed_at,
    request_type,
    request_status,
    hours_to_close,
    councilor_name,
    councilor_role,
    ward_id,
    is_overdue
FROM warehouse.silver.fct_311_council_pulse
ORDER BY created_at DESC
