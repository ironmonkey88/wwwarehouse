# 🛡️ WWWarehouse Quality Standards: Factory Integrity

This document defines the mandatory functional tests and **Service Level Agreements (SLAs)** that guarantee the **Wong Way Data Factory** is "Ready for Production."

## 🏛️ 1. Delivery & Logistics (Ingestion & Freshness)
- [ ] **Freshness Audit:** No data source shall be more than **24 hours** behind (unless no new data is available).
- [ ] **Accuracy (Count Check):** Record counts in Bronze must match the SODA/Oxy metadata within a **+/- 0.01%** error margin.
- [ ] **Ingestion Batch Success:** Verified via automated `admin.load_history` or Slack confirm.

## 🔪 2. Food Prep Quality (dbt Modeling & Integrity)
- [ ] **Schema Conformance:** All Silver and Gold models must have **100% test coverage** for `unique` and `not_null` primary keys.
- [ ] **Data Integrity:** All TDD tests (e.g., specific value/business logic validations) must pass before a Gold layer deployment.
- [ ] **Lineage Mandate:** 100% upstream-to-downstream visibility. Each **Assembly Line** must be clear from Source to Product.
- [ ] **Visual Certification (The Proof Section):** Every Dashboard must include a footer section that demonstrates the data is correct (e.g., "Last Certified," "Test Pass Rate," "Lineage Link").

## 🚪 3. Kitchen Accessibility (Environment & Domain)
- [ ] **Domain Mapping:** `thewongway.co` subdomains must be reachable and reflect the latest static or dynamic analytics.
- [ ] **Asset Registry Accuracy:** All credentials and connection strings are stored securely in GCP Secret Manager and recorded in the [Asset Registry](file:///Users/gordonwong/WWWarehouse/docs/asset_registry.md).

## 🤖 4. Kilo Agent Autonomy (Self-Healing)
- [ ] **Repair Logic Verified:** In the event of an SLA breach, the Kilo Agent must re-parse the source data using an LLM.
- [ ] **Alerting:** Every self-healing and deployment state must trigger a Slack message to **stonezuppe.slack.com**.
- [ ] **Continuous Regression:** With every new code change or task execution, the agent must run regression testing to ensure previously functioning pipelines and tests remain unbroken.

---

### 👨‍🍳 Certification
A model or pipeline is only considered **"Done" (The Wong Way)** if all applicable checks above are marked ✅. Failure of any Tier 1 or Tier 2 check triggers an automated **"Stop the Line"** protocol.

---
*Created by the Wong Way Assistant | April 2026*
