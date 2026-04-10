SELECT
    id,
    type,
    classification,
    category,
    most_recent_status,
    date_created,
    most_recent_status_date,
    ward,
    origin_of_request
FROM bronze.service_requests
ORDER BY date_created DESC
