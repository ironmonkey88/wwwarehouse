{% macro setup_gcs() %}
    {% set setup_query %}
        INSTALL httpfs;
        LOAD httpfs;
        -- Use environment variables for GCS authentication
        SET s3_endpoint = 'storage.googleapis.com';
        SET s3_access_key_id = '{{ env_var("GCS_ACCESS_KEY_ID", "") }}';
        SET s3_secret_access_key = '{{ env_var("GCS_SECRET_ACCESS_KEY", "") }}';
        SET s3_region = 'auto';
    {% endset %}

    {% do run_query(setup_query) %}
{% endmacro %}
