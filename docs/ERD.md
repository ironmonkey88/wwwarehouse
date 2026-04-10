# WWWarehouse: Entity Relationship Diagram (ERD) 🗺️

This document defines the schema topology and logical relationships across the Medallion layers.

## 🏛 1. Core Refinery Schema
The following diagram represents the current state of the **Councilor** and **Public Safety** refinery lines.

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

## 📋 2. Relationship Catalog

| Relationship | Cardinality | Join Logic | Status |
| :--- | :--- | :--- | :--- |
| `stg_councilors` -> `dim_wards` | Many-to-One | `councilor_ward` = `ward_id` | 🏗 Planned |

---
*Created by the Wong Way Assistant | April 2026*
