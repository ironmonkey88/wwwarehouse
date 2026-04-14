{% macro setup_local() %}
    {% set setup_query %}
        -- Prepare namespaces for Lakehouse partitions
        CREATE SCHEMA IF NOT EXISTS bronze_311;
        CREATE SCHEMA IF NOT EXISTS bronze;
        
        -- Register local files as views
        -- This bypasses the need for GCS HMAC credentials
        CREATE OR REPLACE VIEW bronze_311.service_requests AS 
        SELECT * FROM read_parquet('/Users/gordonwong/WWWarehouse/data/service_requests.parquet');

        CREATE OR REPLACE VIEW bronze.councilors AS
        SELECT * FROM read_json_auto('/Users/gordonwong/WWWarehouse/data/councilors.jsonl.gz');
    {% endset %}

    {% do run_query(setup_query) %}
{% endmacro %}
