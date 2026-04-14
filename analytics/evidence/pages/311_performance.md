# 📊 311 Tactical Performance

Analyze constituency demand and city backlog resolution over the last 24 months.

```sql wards_list
SELECT DISTINCT ward_id FROM civic_pulse.monthly_performance ORDER BY 1
```

<div class="grid grid-cols-2 gap-4">
    <Dropdown 
        name=ward_filter 
        data={wards_list} 
        value=ward_id 
        label=ward_id
        title="Ward Select"
    />

    <Dropdown name=metric_picker defaultValue="incoming_count" title="Metric">
        <DropdownOption value="incoming_count" label="Demand" />
        <DropdownOption value="carryover_count" label="Backlog" />
        <DropdownOption value="mom_demand_change" label="Growth Rate" />
    </Dropdown>
</div>

```sql performance_data
SELECT 
    month_start,
    ward_id,
    request_type,
    incoming_count,
    carryover_count,
    mom_demand_change,
    -- Reactive column based on picker
    ${inputs.metric_picker} as primary_value
FROM civic_pulse.monthly_performance
WHERE month_start >= date_trunc('month', CURRENT_DATE) - interval 24 month
AND ward_id = '${inputs.ward_filter}'
ORDER BY month_start ASC
```

## 📉 Visual Analysis
Primary metric (Volume) on the left axis; MoM Growth Rate (%) on the right axis.

<BarChart 
    data={performance_data} 
    x=month_start 
    y=primary_value
    series=ward_id
    y2=mom_demand_change
    y2SeriesType=line
    y2Fmt=pct
    title="311 Performance: Volume vs Growth"
    yAxisTitle="Volume"
    y2AxisTitle="Growth Rate (%)"
    stack=true
/>

## 📋 Data Grid
Detailed monthly breakdown for the selected wards and metrics.

<DataTable data={performance_data} search=true sort=true>
    <Column id=month_start label="Month" fmt="yyyy-MM" />
    <Column id=ward_id label="Ward" />
    <Column id=request_type label="Type" />
    <Column id=incoming_count label="Incoming" />
    <Column id=carryover_count label="Backlog" />
    <Column id=mom_demand_change label="Growth %" fmt=pct />
</DataTable>

---
*Certified by the Witness via Seal DASHBOARD-001*
