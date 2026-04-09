# WWWarehouse: Definition of Done (DoD) 📜

No task or pipeline is considered "Done" until the following criteria are met and verified by the **Wong Way Assistant (Kilo)**.

## 🏛 1. The Lineage Mandate
- [ ] Every model must trace back to an **Explicit Source** in `sources.yml`.
- [ ] The `dbt docs` lineage graph must show a complete, unbroken chain from Source -> Bronze -> Silver -> Gold.
- [ ] **No Shadow Data:** Any model not connected to a final **Knowledge Product** in the lineage graph is a violation.

## 🧭 2. The SLA (Service Level Agreement)
- [ ] **Freshness:** Data update timestamp is < **24 hours** from the source (unless no new data is available).
- [ ] **Accuracy:** Bronze record count matches the SODA/Oxy metadata (+/- 0.01%).
- [ ] **Integrity:** `unique` and `not_null` tests pass for all primary keys in Silver/Gold layers.
- [ ] **Observability:** 100% of columns in the Gold layer have descriptions in `schema.yml`.
- [ ] **Certification:** Every Dashboard includes a mandatory **"Proof Section"** at the bottom demonstrating data correctness.

## 🤖 3. Agentic Autonomy (Kilo)
- [ ] Self-healing logic is implemented and tested for the specific scraper.
- [ ] The repair cycle (LLM Re-parse -> TDD -> Deploy) is verified.
- [ ] A **Slack Alert** to `stonezuppe.slack.com` is triggered for both success and healing events.

## 📦 4. Deployment & Handover
- [ ] **Architecture Check:** Any structural/tooling shift is recorded in an **ADR** with the rationale.
- [ ] **Bead Close:** The tracking **Bead (bd)** is closed with a final summary of changes and the "Why."
- [ ] **Lineage:** `dbt docs` are updated and reflect the latest assembly line state.
- [ ] `git push` succeeded and remote is in sync.

---
*Created by the Wong Way Assistant | April 2026*
