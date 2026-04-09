# 🧪 WWWarehouse: Ingestion Layer (Assembly Lines)

This directory contains the logic for our automated **Assembly Lines**. We follow the **EL as Code** philosophy using **dlt (data load tool)**.

## 🏗 The dlt Advantage
- **Verified Sources:** We leverage dlt's library of community-maintained Python templates for popular SaaS and SQL sources.
- **Library vs. Platform:** dlt is a Python library that runs natively in Cloud Run Jobs (Zero-Idle), avoiding the "Platform Tax" of Airbyte.
- **Schema Evolution:** dlt automatically manages DuckDB/GCS schema updates if the source structure changes.

## 🚀 Creating a New Assembly Line
To pull a community-maintained template:
```bash
dlt init <source_name> <destination_name>
```
*Example (Stripe to DuckDB):*
```bash
dlt init stripe duckdb
```
The resulting Python code will be placed in this directory for **Kilo** to customize and manage.

## 🛡 Quality & Odometer
Every dlt pipeline must return its **`LoadInfo`** and **`Trace`** to the metadata Odometer in DuckDB for Slack alerting and SLA monitoring.

---
*Created by the Wong Way Assistant | April 2026*
