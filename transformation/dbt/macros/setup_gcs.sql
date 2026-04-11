{% macro setup_gcs() %}
    {% set setup_query %}
        INSTALL httpfs;
        LOAD httpfs;
        -- Use environment variables for GCS authentication
        SET s3_endpoint = 'storage.googleapis.com';
        SET s3_access_key_id = '{{ env_var("GCS_ACCESS_KEY_ID", "") }}';
        SET s3_secret_access_key = '{{ env_var("GCS_SECRET_ACCESS_KEY", "") }}';
        SET s3_region = 'us-east1';
        SET s3_url_style = 'path';

        -- Prepare namespaces for Lakehouse partitions
        CREATE SCHEMA IF NOT EXISTS bronze_311;
        
        -- Register external Parquet partitions as views
        CREATE OR REPLACE VIEW bronze_311.service_requests AS 
        SELECT * FROM read_parquet('s3://warehouse-011793-factory/bronze/service_requests.parquet');
    {% endset %}

    {% do run_query(setup_query) %}
{% endmacro %}
