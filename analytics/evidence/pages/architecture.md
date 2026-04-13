---
title: Architecture
description: The technical topography of the Wong Way Warehouse.
---

# 🏛️ Architecture: Zero-Idle Data Refinery

The **Somerville Civic Pulse** is built on a serverless, agentic architecture designed for maximum performance at near-zero idle cost.

---

## 🗺️ Data Topography (ERD)

The following diagram illustrates the relationship between our cleansed **Silver Layer** dimensions and facts for the Councilor refinery line.

```mermaid
erDiagram
    %% Silver Layer (Cleaned Dimensions/Facts)
    STG_COUNCILORS {
        string councilor_id PK "DLT Hash ID"
        string councilor_name
        string councilor_ward "Join key to Wards"
        timestamp processed_at
    }

    DIM_WARDS {
        string ward_id PK
        string ward_name
        string representative_name
    }

    %% Relationships
    STG_COUNCILORS }o--|| DIM_WARDS : "represents"
```

---

## 🛠️ The Technical Stack

We adhere to the **Sovereign Engine** standards:

1.  **Ingestion**: `dlt` (embedded Python) for declarative source-to-vault mirroring.
2.  **Refinery**: `dbt` (DuckDB adapter) for high-speed local transformation.
3.  **Warehouse**: **DuckDB + GCS** (Standard Parquet) enabling high-concurrency serverless query execution.
4.  **Plating**: **Evidence.dev** (Vite + Markdown) for sub-second dashboard rendering.
5.  **Compute**: Google Cloud Run (Scheduled Jobs) for zero-latency refinery cycles.

---
*Certified by the Sovereign Architect | Mission Code: REQ-003-ARCH* 🏮
