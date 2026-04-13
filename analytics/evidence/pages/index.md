# Somerville Civic Pulse 🏮

> **"Always do things the Wong Way."**

The **Somerville Civic Pulse** is a high-fidelity, agentic data factory. Built on the **Wong Way Warehouse** architecture, this platform produces a "Gold Standard" view of municipal service requests through automated ingestion, refinery, and triple-seal audit protocols.

<Alert status="info">
This project is an autonomous "Zero-Idle" factory. It exists to provide 100% transparent, verifiable insights into the civic health of Somerville.
</Alert>

---

## 🏛️ The Sovereign Hub
Explore the genetic layers of the Pulse:

| 📊 **[Mission Status](status)** | 🏛️ **[Architecture](architecture)** | 🧬 **[Philosophy](philosophy)** | 🧪 **[Data Lineage](lineage)** |
| :--- | :--- | :--- | :--- |
| Curated progress and phase milestones. | ERD diagrams and infrastructure technical specs. | The genetic logic of the Sovereign engine. | Data dictionary and refinery logic audits. |

| 👑 **[Councilor Performance](council_report)** | 🔬 **[Data Profiling](profiling)** |
| :--- | :--- |
| Ward-level accountability and ticket resolution. | Detailed statistical health of 1.16M records. |

---

## 📈 Executive Summary: 311 Service Requests

<Alert status="success">
This data has been verified via the <b>Wong Way Triple-Seal Audit</b> — Size, Shape, and Sample parity confirmed against the Socrata source.
</Alert>

## Overview

<BigValue
    data={total_requests}
    value="total_requests"
    title="Total Requests (Historical)"
/>

```sql total_requests
SELECT sum(request_count) as total_requests FROM civic_pulse.type_distribution
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
SELECT type, request_count FROM civic_pulse.type_distribution
```

## Requests by Ward

<BarChart
    data={requests_by_ward}
    x="ward"
    y="ward_count"
    title="Requests by Ward"
/>

```sql requests_by_ward
SELECT ward, ward_count FROM civic_pulse.ward_distribution
```

## Daily Volume Trend

<LineChart
    data={daily_trend}
    x="request_date"
    y="daily_count"
    title="Daily Request Volume"
/>

```sql daily_trend
SELECT request_date, daily_count FROM civic_pulse.daily_volume
```

## Recent Requests
*Atomic grain limited to the last 100 entries for performance.*

<DataTable
    data={recent_requests}
    rows=20
    search=true
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
LIMIT 100
```

---
*Powered by Wong Way Data Factory | REQ-004: Gold Standard Dashboard*
