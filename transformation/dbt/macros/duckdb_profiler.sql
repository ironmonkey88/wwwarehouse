
{% macro duckdb__select_from_information_schema_columns(relation) %}
  select
    column_name as column_name,
    data_type as data_type,
    table_name as table_name,
    schema_name as table_schema,
    column_index as ordinal_position
  from duckdb_columns()
  where lower(schema_name) = lower('{{ relation.schema }}') 
    and lower(table_name) = lower('{{ relation.identifier }}')
  order by column_index asc
{% endmacro %}
