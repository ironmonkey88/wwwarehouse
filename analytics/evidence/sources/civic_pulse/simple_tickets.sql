-- Simple Ticket Count for MoM Trust Verification
-- Uses the last 2 months of data to ensure we have a comparison point.
SELECT 
    month_start, 
    sum(incoming_count) as total_tickets 
FROM warehouse.silver.fct_311_monthly_performance 
GROUP BY 1 
ORDER BY 1 DESC 
LIMIT 2
