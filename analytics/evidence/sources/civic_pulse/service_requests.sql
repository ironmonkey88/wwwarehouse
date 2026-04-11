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
FROM read_parquet('s3://warehouse-011793-factory/bronze/service_requests.parquet')
ORDER BY date_created DESC
