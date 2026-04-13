{{ config(
    materialized='table'
) }}

{{ dbt_profiler.get_profile(relation=ref('stg_311_requests')) }}
