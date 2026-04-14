# 🛡️ Trust Check: Single-Metric Report

This is a minimalist report designed for high-integrity verification of the Somerville Civic Pulse dashboard rendering.

```sql simple_tickets
SELECT * FROM civic_pulse.simple_tickets
```

<BigValue 
  data={simple_tickets} 
  value=total_tickets 
  title="Tickets in April 2026 (To Date)"
/>

## Raw Verification Data (Last 2 Months)

<DataTable data={simple_tickets}>
  <Column id=month_start label="Month" fmt="yyyy-MM" />
  <Column id=total_tickets label="Total Tickets" />
</DataTable>

---
*Certified for Verification by Evidence v5.4.2*
