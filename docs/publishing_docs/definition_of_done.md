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
- [ ] **Sentinel Audit:** `python3 bin/focus_sentinel.py` passes with zero Critical Pollution events.
- [ ] **Architecture Check:** Any structural/tooling shift is recorded in an **ADR** with the rationale.
- [ ] **Lineage Hub:** `bin/publish_docs.sh` has been executed; the updated lineage is verified at `civicpulse.thewongway.co`.
- [ ] **Bead Close:** The tracking **Bead (bd)** is closed with a final summary of changes and the "Why."
- [ ] **Lineage:** `dbt docs` are updated and reflect the latest assembly line state.
- [ ] `git push` succeeded and remote is in sync.

## 🏛 5. The Topology Seal (ERD)
- [ ] **Schema Mapping:** Every Silver and Gold model must be represented in the [Project ERD](file:///Users/gordonwong/WWWarehouse/docs/ERD.md).
- [ ] **Relationship Integrity:** All foreign key relationships (joins) must be explicitly diagrammed using Mermaid.js syntax.

## 🏛 6. The Lightdash Discovery Seal
- [ ] **Semantic Discovery:** Every Gold model must be tagged with `tags: ["lightdash"]` in `schema.yml`.
- [ ] **Queryability:** The model must be visible in the Lightdash Explorer and joinable without SQL errors.

## 🌍 7. The Public Portal Handshake
- [ ] **Knowledge Hub Update:** The [Project ERD](file:///Users/gordonwong/WWWarehouse/docs/ERD.md) and dbt docs must be published to [civicpulse.thewongway.co](http://civicpulse.thewongway.co) via `bin/publish_docs.sh`.
- [ ] **Accessibility:** The latest model schema, descriptions, and lineage must be user-accessible on the public site.

## 🧪 8. The Functional Proof Seal (TDD)
- [ ] **Logic Verification:** Every significant functional change (Scrapers, Transformers) has a corresponding test case in `tests/functional/`.
- [ ] **Mock Sovereignty:** Tests must demonstrate success using mock data to ensure laptop-independent verification.
- [ ] **Pass Gate:** `pytest tests/functional/` must return 100% pass before the final "Bead" handshake.

---
*Created by the Wong Way Assistant | April 2026*
