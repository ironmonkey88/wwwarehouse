# 💡 WWWarehouse Development Philosophy

This document outlines the core principles and values that guide development on the **Wong Way Warehouse (WWWarehouse)** platform.

## 1. Vibe Chaining
*   **Principle**: Adapt, don't re-invent.
*   **Action**: Use established patterns from Gordon's **CivicPulse** project (GCP structures, dbt macros, and `bd` task logic) to minimize new, unvetted code.

## 2. Occam’s DWH (The Simplest Solution)
*   **Principle**: Complexity is a legacy cost.
*   **Action**: Favor "boring" technology. A shell script or a DuckDB `ATTACH` is superior to a message queue or a cloud-native orchestrator if the load allows.

## 3. Knowledge Products (The Assembly Line)
*   **Principle**: Engineering is at the service of the final **Knowledge Product**.
*   **Action**: Every data pipeline must begin with a defined metric (The Product). We build automated **Assembly Lines** to produce these products.

## 4. The "Steel Thread"
*   **Principle**: Rapid value delivery.
*   **Action**: Establish the complete E2E flow (Ingestion -> DuckDB -> dbt -> BI) for **"Rat Complaints"** first. Once the "Steel Thread" is solid, we hang further datasets on it.

## 5. Theory of Constraints (ToC)
*   **Principle**: Find the bottleneck.
*   **Application**: If we hit local memory limits or GCS latency peaks, that is our only priority. Do not optimize "ready" dashboards if the ingestion is stalled.

## 6. Token & Cost Hygiene
*   **Principle**: Be "cheap" where it makes sense.
*   **Action**: Use local AI (Ollama) via `scripts/local_bridge.py` for data-heavy tasks. Keep agent turns concise.

## 7. Laptop-Independent Execution (Cloud Sovereignty)
*   **Principle**: The production factory stays on when your laptop goes off.
*   **Action**: All **Assembly Lines** (Ingestion/Refinery) and **Knowledge Products** (Dashboards) must be hosted on **GCP (Cloud Run/GCS)** or **MotherDuck**. 
*   **Exceptions**: Local development, manual task management (`bd`), and local LLM models (Kilo/Ollama) are the only persistent laptop-bound components.

---
*Created by the Wong Way Assistant | April 2026*
