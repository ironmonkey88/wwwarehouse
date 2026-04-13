# Councilor Accountability Pulse 🏮

This dashboard monitors the effectiveness of Ward Councilors in resolving 311 Service Requests for their constituents.

## 📊 Councilor Performance Leaderboard
*Average response time for closed tickets (Aggregated Metrics).*

```sql leaderboard
select 
    councilor_name, 
    avg_resolution_hours,
    total_tickets
from civic_pulse.councilor_summary
order by avg_resolution_hours asc
```

<BarChart 
    data={leaderboard} 
    x=councilor_name 
    y=avg_resolution_hours 
    swapXY=true 
    title="Avg Hours to Close by Councilor"
/>

## 🚨 Overdue Visibility
*Tickets taking more than 1 week (168 hours) to resolve.*

```sql overdue_stats
select 
    councilor_name, 
    overdue_count,
    round(overdue_count * 100.0 / sum(overdue_count) over(), 1) as city_percent
from civic_pulse.councilor_summary
where overdue_count > 0
order by overdue_count desc
```

<DataTable data={overdue_stats}>
    <Column id="councilor_name" title="Councilor" />
    <Column id="overdue_count" title="Overdue Tickets" />
    <Column id="city_percent" title="% of City Overdue" fmt="0.0%" />
</DataTable>

---

## 📂 Recent Ticket Stream
*High-resolution audit of the most recent service requests.*

```sql ticket_feed
select 
    id AS service_request_id,
    date_created AS created_at,
    type AS request_type,
    most_recent_status AS request_status
from civic_pulse.service_requests
limit 100
```

<DataTable data={ticket_feed} search=true />

---
*Powered by Wong Way Data Factory | REQ-003: Aggregated Gold MVP*
