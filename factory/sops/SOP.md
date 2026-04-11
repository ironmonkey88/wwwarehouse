# 📜 WWWarehouse: Standard Operating Procedures (SOPs)

This document contains the mandatory procedures for building, maintaining, and scaling the **Wong Way Data Factory**. These SOPs ensure that every **Assembly Line** and **Knowledge Product** meets our "Right Principle" and "Zero-Idle" standards.

---

## 🏛 1. Governance & Tasks
- **[SOP-001: Factory Governance (Beads)](file:///Users/gordonwong/WWWarehouse/docs/sop/001_governance_beads.md)**
    - How to use the `bd` system to track work, claim beads, and audit the factory history.

## 🏗 2. Manufacturing (Ingestion & Refinery)
- **[SOP-002: Commissioning an Assembly Line](file:///Users/gordonwong/WWWarehouse/docs/sop/002_assembly_line_ingestion.md)**
    - How to use **dlt (data load tool)** and **Kilo** to build serverless Python-native ingestion.
- **[SOP-003: Refining Raw Material (dbt)](file:///Users/gordonwong/WWWarehouse/docs/sop/003_transformation_refinery.md)**
    - The Medallion Architecture (Bronze/Silver/Gold) and the "Lineage Mandate."

## 📊 3. Delivery (Knowledge Products)
- **[SOP-004: Plating a Knowledge Product](file:///Users/gordonwong/WWWarehouse/docs/sop/004_knowledge_product_plating.md)**
    - How to build BI dashboards (Lightdash/Evidence) with a mandatory **"Proof Section."**
- **[SOP-005: Value-Dense Metrics (Cube)](file:///Users/gordonwong/WWWarehouse/docs/sop/005_value_dense_metrics.md)**
    - How to use **Cube.dev** as a Universal Metric Gateway.

## 🤖 4. Autonomous Maintenance
- **[SOP-006: Autonomous Healing & TDD](file:///Users/gordonwong/WWWarehouse/docs/sop/006_autonomous_healing.md)**
    - The "Kilo Repair Loop": How agents respond to failures using TDD and self-healing dlt/dbt.

## 📈 5. Scaling
- **[SOP-007: Factory Upgradability](file:///Users/gordonwong/WWWarehouse/docs/sop/007_factory_upgradability.md)**
    - How to "Upgrade" a component from Serverless (Cloud Run) to Dedicated (GCP Instance/MotherDuck).

---
*Created by the Wong Way Assistant | April 2026*
