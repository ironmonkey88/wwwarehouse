# 📜 WWWarehouse: Standard Operating Procedures (SOPs)

This document contains the mandatory procedures for building, maintaining, and scaling the **Wong Way Data Factory**. These SOPs ensure that every **Assembly Line** and **Knowledge Product** meets our "Right Principle" and "Zero-Idle" standards.

---

## 🧭 0. Agent Session Protocol
- **[SOP-000: How to Start (Session Protocol)](file:///Users/gordonwong/WWWarehouse/factory/sops/000_agent_session_protocol.md)**
    - The mandatory startup sequence, task lifecycle, and shutdown checklist for every agent session.

## 🏛 1. Governance & Tasks
- **[SOP-001: Factory Governance (Beads)](file:///Users/gordonwong/WWWarehouse/factory/sops/001_governance_beads.md)**
    - How to use the `bd` system to track work, claim beads, and audit the factory history.

## 🏗 2. Manufacturing (Ingestion & Refinery)
- **[SOP-002: Commissioning an Assembly Line](file:///Users/gordonwong/WWWarehouse/factory/sops/002_assembly_line_ingestion.md)**
    - How to use **dlt (data load tool)** to build serverless Python-native ingestion.
- **[SOP-003: Refining Raw Material (dbt)](file:///Users/gordonwong/WWWarehouse/factory/sops/003_transformation_refinery.md)**
    - The Medallion Architecture (Bronze/Silver/Gold) and the "Lineage Mandate."

## 📊 3. Delivery (Knowledge Products)
- **[SOP-004: Plating a Knowledge Product](file:///Users/gordonwong/WWWarehouse/factory/sops/004_knowledge_product_plating.md)**
    - How to build BI dashboards (Lightdash/Evidence) with a mandatory **"Proof Section."**

## 📈 4. Scaling
- **[SOP-007: Factory Upgradability](file:///Users/gordonwong/WWWarehouse/factory/sops/007_factory_upgradability.md)**
    - How to "Upgrade" a component from Serverless (Cloud Run) to Dedicated (GCP Instance/MotherDuck).

## 🦅 5. Environmental Sovereignty (Execution Standard)
To eliminate environment drift and permission friction, all autonomous development must adhere to:
- **Direct Binary Pathing**: Never rely on `source activate`. Always use the absolute path to the virtual environment binary (e.g., `./.venv/bin/python3`).
- **The Binary Stamp**: All executable tools in `bin/` must include a Shebang Header (`#!/usr/bin/env <interp>`) and be followed by an immediate `chmod +x` command.
- **Fixed-Point Auditing**: High-velocity refinery audits must use the **Locked Handshake** (auditing against the local High-Water Mark) to handle data jitter gracefully.

## 📦 6. Version Matrix
The canonical tech stack version matrix is maintained in [`master_plan.md` §5](file:///Users/gordonwong/WWWarehouse/docs/master_plan.md). All other documents must reference that section rather than maintaining independent version lists.

---
*Created by the Wong Way Data Factory | April 2026*
