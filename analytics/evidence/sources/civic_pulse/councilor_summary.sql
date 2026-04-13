-- [ARCHITECT] Registering the high-performance 'Gold' Councilor Summary table
-- This collapses 715,000 tickets into 7 summary rows for sub-second rendering.
SELECT
    councilor_name,
    councilor_role,
    total_tickets,
    avg_resolution_hours,
    overdue_count
FROM warehouse.silver.fct_councilor_summary
ORDER BY avg_resolution_hours ASC
