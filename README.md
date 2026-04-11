# WWWarehouse (Wong Way Warehouse) 🏗️

> **"Always do things the Wong Way."**

WWWarehouse is an agentic, serverless, and "Zero-Idle" **Data Factory** designed for the modern data repository (MDR) era. Built by **Wong Way**, it focuses on using automated **Assembly Lines** to produce high-value **Knowledge Products**.

## 🏛 The "Wong Way" Architecture
- **Staging Hive:** Every ingestion pipeline operates in its own partition (DuckDB file on GCS) to avoid concurrency collisions.
- **On-Demand Lakehouse:** Uses **DuckDB + GCS** for sub-second analysis with $0 base cost when idle.
- **Serverless Compute:** Orchestrated via **Cloud Run Jobs** to scale from zero to high concurrency.
- **Agentic ETL:** Powered by **Kilo Code** and **Gastown** for self-healing and parallel data scraping.

## 📋 Logical Structure
- `infra/`: Terraform configurations for the GCP "Zero-Idle" stack.
- `ingestion/`: Logic for Airbyte (Structured) and Oxy.tech (Unstructured) sources.
- `transformation/`: dbt project implementing a Medallion flow (Bronze, Silver, Gold).
- `analysis/`: Lightdash (Self-service) and Evidence.dev (Executive Plating).
- `agents/`: Configs for the agentic workforce.
- `docs/`: Manifesto, philosophy, and ADRs.

## 🚀 Getting Started
Check the [Manifesto](docs/manifesto.md) for our core principles or follow the [Assistant Role](docs/assistant_role.md) guide to understand how to collaborate with the system.

---
*Created by the Wong Way Assistant for Gordon Wong | April 2026*
