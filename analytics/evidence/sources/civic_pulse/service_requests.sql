-- [ARCHITECT] Evidence Source: Service Requests (Recent Feed)
-- This source provides the atomic grain for the most recent tickets.
SELECT
    id,
    type,
    most_recent_status,
    date_created,
    ward,
    origin_of_request
FROM warehouse.silver.stg_311_requests
ORDER BY date_created DESC
LIMIT 100
