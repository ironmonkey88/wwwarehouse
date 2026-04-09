# ADR-001: The "Staging Hive" Ingestion Pattern

**Status:** Proposed & Accepted
**Date:** April 2026
**Architect:** Gordon Wong
**Assistant:** Wong Way AI

## 🛡 Problem
Concurrency collisions in **Zero-Idle** environments. Standard DuckDB is single-writer. If parallel scrapers or ingestion jobs (311, GIS, Portals) try to write to the same central database file on GCS at the same time, we encounter file-locking or corruption. 

## 🏗 Decision
We will implement the **Staging Hive** pattern. In place of a single "Bronze" database, we create **Pipeline-Specific DuckDB partitions**.

- **Structure:** `gs://warehouse/bronze/{pipeline_name}.duckdb`.
- **Strategy:** Each Cloud Run Job owns its own `.duckdb` file. No locking conflicts.
- **Merge Point:** The dbt transformation layer will `ATTACH` these files and unify them into a single "Silver" table.

## 🧠 Rationale
1. **Parallelism:** We need to run multiple ingestions simultaneously (via Gastown) without managing a complex lock-coordinator or a persistent RDBMS.
2. **Minimal Maintenance:** By isolating the files, we avoid "Blast Radius" issues where one corrupted or locked file brings down the entire ingestion suite.
3. **DuckDB Strengths:** DuckDB excels at `ATTACH`ing disparate files for a unified query, making this pattern high-performance and low-overhead.

## ⚖ Consequences
### Positive
- **High Concurrency:** Unlimited parallel pipelines (Gastown mode).
- **Isolation:** A failure in the "311" ingestion doesn't block the "GIS" pipeline.
- **Granular Recovery:** Rewind a single pipeline's state without a full restore.

### Negative
- **Metadata Management:** dbt needs a dynamic `ATTACH` macro to find all active partitions.
- **GCS Overhead:** Slightly more files to manage, though DuckDB is highly efficient.

---
*Accepted by Gordon Wong | April 2026*
