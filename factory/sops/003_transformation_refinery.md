# 🥈 SOP-003: Refining Raw Material (Transformation)

This procedure defines the Medallion Architecture (Bronze, Silver, Gold) standards for the **WWWarehouse Data Factory**.

---

## 🥉 1. Bronze (The Raw Intake)
*   **Source**: The `dlt` ingestion pipeline loads data into the `bronze` schema.
*   **Standards**: 
    - **No Transformations**: Data remains exactly as fetched.
    - **Natural Keys**: Must validate the original source ID.
    - **Lineage**: Source table must be defined in `sources.yml`.

## 🥈 2. Silver (The Refinery)
The Silver layer is where data is cleaned, conformed, and turned into **Queryable Knowledge**.

*   **Pattern**: 3rd Normal Form (3NF) style Fact and Dimension tables.
*   **Deduplication**: Mandatory `row_number()` tie-breaking on ingestion timestamps.
*   **Casting**: All numeric, date, and timestamp fields must be explicitly cast to DuckDB types.
*   **Testing**: Must pass `unique` and `not_null` checks on all primary keys.

## 🥇 3. Gold (Value-Dense Layer)
The Gold layer is BI-ready and optimized for speed and clarity.

*   **Metric Layer**: Use **dbt semantic models** or **Cube** to define common metrics (e.g., "Active Users," "Equity Score").
*   **Pre-Aggregation**: For high-volume collections, use **Static Semantic** pre-calculation to Parquet files on GCS.
*   **Documentation**: 100% of columns must have descriptions.

---
*Created by the Wong Way Assistant | April 2026*
