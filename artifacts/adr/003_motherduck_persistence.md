# ADR-003: MotherDuck for Persistent Gold Persistence 🧩

## **Status**
Accepted (April 2026)

## **Context**
The **WWWarehouse** factory uses DuckDB + GCS (Parquet) for "Zero-Idle" refinery and ingestion. While this is perfect for batch processing, modern BI tools (Evidence, Lightdash, Cube.js) require a stable, persistent, and fast SQL endpoint to serve "Knowledge Products" to consumers without "Cold Start" delays.

## **Decision**
We will use **MotherDuck** as the "Front Door" (persistent host) for our **Gold Layer** (certified metrics).

## **Rationale**
1.  **Persistence**: Unlike a Cloud Run Job (which spins down), MotherDuck provides a 24/7 cloud-hosted DuckDB instance that stores our Gold tables persistently.
2.  **Concurrency**: It handles multiple dashboard users or parallel Cube.js requests without us needing to manage a persistent VM or Postgres instance.
3.  **Hybrid Execution**: MotherDuck can query `gs://warehouse/gold/*.parquet` directly AND cache "Hot" tables in its own highly-available cloud storage.
4.  **Zero-Idle Maintenance**: It removes the need for us to manage DuckDB `.db` file locking on GCS, which is a known pain point for multi-user access.
5.  **Cost Efficiency**: For the current scale of WWWarehouse, MotherDuck’s free/low-tier provides all the performance of a high-end data warehouse with $0 infrastructure overhead.

## **Consequences**
- **Pros**: Sub-second dashboard performance; simplified "Knowledge Product" sharing.
- **Cons**: Requires a MotherDuck API token; adds one external cloud provider to our stack.

---
*Created by the Wong Way Assistant | April 2026*
