# ADR-002: The "Zero-Idle" Serverless Stack

**Status:** Proposed & Accepted
**Date:** April 2026
**Architect:** Gordon Wong
**Assistant:** Wong Way AI

## 🛡 Problem
Standard data warehouses (BigQuery, Redshift, Snowflake) and persistent BI VMs (Lightdash/Looker) incur high baseline storage and compute costs for small-to-medium datasets. For a consulting firm (Wong Way), a $50/month idle bill is unacceptable.

## 🏗 Decision
We will standardize on a **"Zero-Idle"** stack that scales precisely to usage.

- **DWH Storage:** GCS (Standard Storage) as our Parquet/DuckDB "Lakehouse."
- **DWH Compute:** **DuckDB (v1.0+)** using the `httpfs` extension for on-demand query execution.
- **Orchestration:** **Cloud Run Jobs** for ETL and dbt. Costs only when running.
- **Visualization:** 
    - **Evidence.dev** for pre-rendered static "Executive Plating" ($0 hosting on GCS/Firebase).
    - **Lightdash** (Self-hosted on Cloud Run) with cold-starts tolerated for exploration.

## 🧠 Rationale
1. **Low Overhead:** For a project starting with "Rat Complaints," a dedicated warehouse (BigQuery Slot/Snowflake) is a "Space Elevator." DuckDB is the "Ladder."
2. **Cost-to-Value:** We only pay when data is processed. This aligns with the "Wong Way" consulting model where infrastructure costs should not bleed when idle.
3. **Speed of Dev (Local-First):** By using DuckDB and dbt, the development environment on Gordon's laptop is an exact mirror of the Production Cloud Run job.
### Positive
- **No Idle Costs:** Bill scales directly with data processing and web traffic.
- **Independence:** Decoupled from expensive, proprietary warehouse providers.
- **Local-Cloud Symmetry:** Devs run the *exact same* DuckDB models locally.

### Negative
- **Cold Starts:** First dashboard load after a long period may take 5–10 seconds.
- **Management:** We must manage our own dbt + Cloud Run deployments (facilitated by **Kilo Code**).

---
*Accepted by Gordon Wong | April 2026*
