# System Architecture: The ZIST Stack 🏗️

The Somerville Civic Pulse is built on **Zero-Idle Sovereign Technology (ZIST)**. This architecture ensures high performance and modular scalability with a base infrastructure cost of $0/month when idle.

## 🏛️ The Architecture Layers

### 1. Ingestion Layer (The Assembler)
- **Tooling**: `dlt` (data load tool)
- **Pattern**: Python-native extraction from City of Somerville SODA APIs.
- **Persistence**: Raw data is landed as Parquet files in **Google Cloud Storage (GCS)**.

### 2. Refinery Layer (The Refiner)
- **Tooling**: `dbt` (data build tool) + **DuckDB**
- **Pattern**: The "Staging Hive". Every batch is processed in a serverless DuckDB instance.
- **Medallion Standard**:
    - **Bronze**: Raw schema-on-read Parquet.
    - **Silver**: Cleansed, deduplicated, and enriched models (e.g., `stg_311`).
    - **Gold**: Dimensional models optimized for sub-second analysis.

### 3. Visualization Layer (The Artisan)
- **Tooling**: **Evidence.dev** + Svelte
- **Pattern**: Static site generation. Data is pre-fetched from the Gold Parquet files into a local DuckDB instance at build time.
- **Delivery**: Fast, static HTML served via GCS and Cloud CDN.

## 🛰️ Sovereignty Gates
- **Independence**: The entire stack is laptop-local-ready but cloud-synchronized.
- **Encryption**: All PII is masked or dropped at the Bronze layer.
- **Observability**: Every model is tested via dbt-expectations.

---
*Technical Blueprint | April 2026*
