{{ config(
    materialized='table',
    tags=['gold', 'accountability']
) }}

/* [ARCHITECT] Gold Summary: Councilor Performance */
/* This table collapses the ticket-level grain into constituent summary rows */

WITH ticket_pulse AS (
    SELECT * FROM {{ ref('fct_311_council_pulse') }}
)

SELECT
    councilor_name,
    councilor_role,
    COUNT(service_request_id) AS total_tickets,
    AVG(hours_to_close) AS avg_resolution_hours,
    -- Count only if the ticket was explicitly flagged as overdue in the fact table
    SUM(CASE WHEN is_overdue THEN 1 ELSE 0 END) AS overdue_count,
    MAX(refinery_processed_at) AS last_refinery_update
FROM ticket_pulse
GROUP BY 1, 2
ORDER BY avg_resolution_hours ASC
