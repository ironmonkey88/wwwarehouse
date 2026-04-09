WITH source_data AS (
    SELECT * FROM {{ source('bronze', 'councilors') }}
)

SELECT
    id AS councilor_id,
    name AS councilor_name,
    ward AS councilor_ward,
    CURRENT_TIMESTAMP AS processed_at
FROM source_data
