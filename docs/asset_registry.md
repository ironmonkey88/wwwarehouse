# 💎 WWWarehouse Asset Registry & Credentials

This document tracks the critical infrastructure, domains, and alerting channels for the **Wong Way Warehouse**.

## 🏗 Infrastructure
- **Cloud Provider:** Google Cloud Platform (GCP)
- **IAC:** Terraform (Planned: `infra/`)
- **DWH:** DuckDB + GCS (Planned: `gs://warehouse/`)

## 🌐 Domains & URLs
- **Root Domain:** `thewongway.co`
- **Analytics Portal:** `civicpulse.thewongway.co` (Legacy)
- **WWWarehouse Audit (Draft):** `audit.thewongway.co` (Subdomain for Evidence.dev)

## 💬 Alerting & Observation
- **Slack Workspace:** `stonezuppe.slack.com`
- **Alerting Channel:** `#wwwarehouse-alerts` (Proposed)
- **Integration:** GCP Cloud Run -> Slack Webhook (via Secret Manager)

## 🤖 Agentic Tools & Libraries
- **Agent Framework:** **Kilo Code** (Primary)
- **Ingestion Engine:** **dlt (data load tool)**
    - **Resource:** [dltHub Verified Sources](https://dlthub.com/docs/dlt-ecosystem/verified-sources/)
    - **Pattern:** Use `dlt init <source> <destination>` to pull community-maintained Python templates.
- **Task Tracker:** **Beads (bd)**
- **Warehouse Extension:** **MotherDuck** (for BI Persistence)
- **Semantic Layer:** **Cube.dev** (Universal Metric Gateway)

---
*Created by the Wong Way Assistant | April 2026*
