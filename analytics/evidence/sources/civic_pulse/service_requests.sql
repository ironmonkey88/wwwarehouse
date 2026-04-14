-- [ARCHITECT] Evidence Source: Service Requests (Recent Feed)
-- This source provides the atomic grain for the most recent tickets.
SELECT
    service_request_id AS id,
    request_type AS type,
    request_status AS most_recent_status,
    created_at AS date_created,
    request_ward AS ward,
    origin_of_request
FROM warehouse.silver.stg_311_requests
ORDER BY created_at DESC
LIMIT 100
