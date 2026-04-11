# Data Quality & Profiling
Detailed profiling of the Somerville 311 Service Request dataset (1.16M records).

<Alert status="info">
Profiling metrics are automatically regenerated in the cloud on every deployment using <code>dbt-profiler</code>.
</Alert>

## Data Quality Summary

```sql column_stats
select * from civic_pulse.profiling_stats
```

<DataTable data={column_stats}>
  <Column id="column_name" title="Field Name" />
  <Column id="data_type" title="Type" />
  <Column id="null_count" title="Missing" />
  <Column id="null_proportion" title="Null %" fmt="0.0%" />
  <Column id="distinct_count" title="Cardinality" />
  <Column id="distinct_proportion" title="Uniqueness" fmt="0.0%" />
  <Column id="max_length" title="Max Len" />
</DataTable>

## Detailed Field Statistics

<Grid cols={2}>
    <Card title="Top Classification Types">
        ```sql type_dist
        select column_name, top_val_1, top_val_count_1, top_val_proportion_1 
        from civic_pulse.profiling_stats 
        where column_name = 'classification'
        ```
        <Value data={type_dist} column="top_val_1" label="Most Common"/>
        <Value data={type_dist} column="top_val_proportion_1" fmt="0.0%" label="Dominance"/>
    </Card>

    <Card title="Top Work Groups">
        ```sql status_dist
        select column_name, top_val_1, top_val_count_1, top_val_proportion_1 
        from civic_pulse.profiling_stats 
        where column_name = 'most_recent_status'
        ```
        <Value data={status_dist} column="top_val_1" label="Status"/>
        <Value data={status_dist} column="top_val_proportion_1" fmt="0.0%" label="Percentage"/>
    </Card>
</Grid>

---
*Powered by Sovereign dbt-profiler & Evidence.dev*
