---
title: Data Lineage
description: The Medallion Data Dictionary and Quality Audit Hub.
---

# 🧪 Data Lineage: The Medallion Dictionary

The **Somerville Civic Pulse** refinery transforms raw municipal signals into the **Gold Standard** analytics. Every field is verified via our Triple-Seal audit (Size, Shape, Sample).

---

## 🏗️ Medallion Entity Registry

| Entity | Layer | Description | Key Fields | Status |
| :--- | :--- | :--- | :--- | :--- |
| `stg_service_requests` | **Silver** | Cleaned 311 request data. | `id`, `type`, `ward`, `date_created` | **ACTIVE** |
| `stg_councilors` | **Silver** | Normalized councilor identity. | `councilor_id`, `name`, `ward` | **ACTIVE** |
| `dim_wards` | **Silver** | Ward-to-Representative map. | `ward_id`, `ward_name` | **ACTIVE** |
| `fct_daily_volume` | **Gold** | Aggregated time-series requests. | `request_date`, `daily_count` | **ACTIVE** |
| `fct_type_distribution` | **Gold** | Categorical breakdown of volume. | `type`, `count` | **ACTIVE** |

---

## 🛡️ Quality Hub & Refinery Docs

For the full, atomic-level lineage and SQL definitions, access the comprehensive **dbt Documentation**:

👉 **[View Full Refinery Documentation (dbt-docs)](/docs/dbt/index.html)** 📚

---

## 🧩 The Triple-Seal Guarantee
Every record published on this portal has passed the **Witness Verification**:
1.  **Size**: Row count parity confirmed against the Socrata endpoint.
2.  **Shape**: Schema and type consistency validated against the Master Spec.
3.  **Sample**: Data fidelity audit confirmed via random sampling across Wards.

---
*Certified by the Sovereign Refiner | Mission Code: REQ-003-LINEAGE* 🏮
