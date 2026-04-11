{{ config(
    materialized='external',
    location="s3://warehouse-011793-factory/gold/profiling/profile_stg_311_requests.parquet"
) }}

{{ dbt_profiler.get_profile(relation=ref('stg_311_requests')) }}
