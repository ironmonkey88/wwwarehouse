# Skill: Visual Verification (The Eye-Test) 👁️

## Objective
Ensure 100% mathematical integrity of all visualizations via manual SQL audits.

## Tactical Instructions

### 1. Cross-Check Protocol
- For every chart total, write a corresponding raw SQL query in the warehouse.
- If the numbers differ by >0%, investigate the 'Semantic Drifts' in Cube or dbt metrics.

### 2. Mock Logic
- During development, use 'WHERE' clauses to sample tiny datasets (1,000 rows) to verify join logic.
- Log these 'Verification Proofs' in the session walkthrough.

### 3. The Proof Section (SOP-004)
- Automated verification: Query 'dbt_test_results' and display 'Tests Passed' status directly on the dashboard.
