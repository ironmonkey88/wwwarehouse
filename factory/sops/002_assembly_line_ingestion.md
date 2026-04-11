# 🏗 SOP-002: Commissioning an Assembly Line (Ingestion)

This procedure defines the "Wong Way" for building a new **Assembly Line** (data ingestion pipeline) for the **WWWarehouse Data Factory**.

---

## 🏗 1. Pre-Construction (The Metric Phase)
Before building a single line of code, you must define the **Knowledge Product** (metric) that justifies this work. 
- **Requirement**: A **Bead** must be open for this metric.
- **Goal**: Identify the source API (e.g., SODA for 311) and the target "Right Data."

## 🚀 2. Building the Line (dlt + Kilo)
We use **dlt (data load tool)** for its serverless efficiency.

1.  **Initialize**: Pull a **Verified Source** template if available.
    ```bash
    dlt init <source> duckdb
    ```
    - The code is now in `ingestion/dlt/<source>/`.
2.  **Kilo Adaptation**: Use the **Kilo Agent** to customize the library:
    - Add authentication (Secret Manager).
    - Configure incremental loading (Checkpoints).
    - Map fields according to the "Right Format."
    - **Apply Binary Stamp**: Every ingestion script MUST include a Shebang Header and be followed by a `chmod +x` command to ensure execution sovereignty. 🛡️
3.  **Local Verification**: Run the pipeline locally against a small sample using **Direct Binary Pathing** (absolute path to `.venv/bin/python3`).
    - **Check**: Verify data landed in a local DuckDB file on GCS.

## 🛡 3. Data Integrity & "The Odometer"
Every assembly line must include the following observability:
- **`LoadInfo` Capture**: Return the dlt load status to the `admin` schema in DuckDB.
- **Fail at Stage**: If dlt returns `failed_jobs`, the pipeline must halt and trigger a **Slack Alert**.
- **The Odometer**: Log the record count and execution time to the **Assembly Line Metadata Registry**.

## 🚀 4. Deployment & Certification
1.  **Containerize**: Package the dlt script as a **Google Cloud Run Job**.
2.  **Schedule**: Define the "Pulse" (Cron) in Cloud Scheduler to meet the **< 24h Freshness SLA**.
3.  **Certify**: Run **`certify_factory.py`** to ensure the new assembly line is properly logged and monitored.

---
*Created by the Wong Way Assistant | April 2026*
