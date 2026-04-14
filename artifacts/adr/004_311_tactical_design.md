# DESIGN-004: 311 Monthly Performance Mart 🏛️

## 🎯 Objective
Design a hardened data model that calculates incoming demand, monthly carry-over (backlog), and MoM rate of change at the Type/Ward granularity.

## 📐 Data Architecture

### 1. The Month Spine
We will generate a `month_spine` CTE covering the last 25 months (24 display + 1 baseline). This ensures no "gaps" in the time series even if a Ward has zero tickets in a given month.

### 2. Carry-over Logic (The "Backlog" Metric)
A ticket is considered "Carry-over" for `Month M` if:
- `created_at` < `Month M Start`
- AND (`closed_at` IS NULL OR `closed_at` >= `Month M Start`)

### 3. Demand Rate of Change (MoM)
We will use the Window Function `LAG()` over the `incoming_count` ordered by `month_start` partitioned by `ward_id` and `request_type`.
- Formula: `(Current Month Incoming - Previous Month Incoming) / Previous Month Incoming`

## 🧩 Schema: `fct_311_monthly_performance`
| Column | Type | Logic |
| :--- | :--- | :--- |
| `month_start` | DATE | Spine anchor |
| `ward_id` | INT | Dimension |
| `request_type` | VARCHAR | Dimension |
| `incoming_count` | INT | `count(*)` where `created_at` in Month |
| `carryover_count` | INT | `count(*)` where still open at Month start |
| `mom_demand_change` | FLOAT | Window function (LAG) |

## 🛡️ Verification marker
- Final table row count MUST equal (Total Wards) * (Total Request Types actually seen in 24m) * 25 months.
