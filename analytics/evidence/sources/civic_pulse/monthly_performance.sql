-- [ARTISAN] Registering the refined Monthly Performance fact table
-- This source provides the tactical metrics (Demand/Backlog) for the portal.
SELECT
    month_start,
    ward_id,
    request_type,
    incoming_count,
    carryover_count,
    mom_demand_change
FROM warehouse.silver.fct_311_monthly_performance
ORDER BY month_start DESC
