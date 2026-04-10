---
title: Somerville 311 Service Requests
description: Live dashboard powered by the Wong Way Triple-Seal verified data pipeline.
---

# Somerville 311 Service Requests

<Alert status="info">
This data has been verified via the <b>Wong Way Triple-Seal Audit</b> — Size, Shape, and Sample parity confirmed against the Socrata source. All timestamps are in Eastern Time.
</Alert>

## Overview

<BigValue
    data={total_requests}
    value="total_requests"
    title="Total Requests (30 Days)"
/>

```sql total_requests
SELECT count(*) as total_requests FROM civic_pulse.service_requests
```

## Requests by Type

<BarChart
    data={requests_by_type}
    x="type"
    y="request_count"
    swapXY=true
    title="Service Requests by Category"
/>

```sql requests_by_type
SELECT
    type,
    count(*) as request_count
FROM civic_pulse.service_requests
GROUP BY type
ORDER BY request_count DESC
```

## Request Status Breakdown

<BarChart
    data={status_breakdown}
    x="most_recent_status"
    y="status_count"
    title="Current Status Distribution"
/>

```sql status_breakdown
SELECT
    most_recent_status,
    count(*) as status_count
FROM civic_pulse.service_requests
GROUP BY most_recent_status
ORDER BY status_count DESC
```

## Requests by Ward

<BarChart
    data={requests_by_ward}
    x="ward"
    y="ward_count"
    title="Requests by Ward"
/>

```sql requests_by_ward
SELECT
    ward,
    count(*) as ward_count
FROM civic_pulse.service_requests
WHERE ward IS NOT NULL
GROUP BY ward
ORDER BY ward
```

## Daily Volume Trend

<LineChart
    data={daily_trend}
    x="request_date"
    y="daily_count"
    title="Daily Request Volume"
/>

```sql daily_trend
SELECT
    CAST(date_created AS DATE) as request_date,
    count(*) as daily_count
FROM civic_pulse.service_requests
GROUP BY request_date
ORDER BY request_date
```

## Recent Requests

<DataTable
    data={recent_requests}
    rows=20
/>

```sql recent_requests
SELECT
    id,
    type,
    most_recent_status,
    date_created,
    ward,
    origin_of_request
FROM civic_pulse.service_requests
ORDER BY date_created DESC
LIMIT 100
```
