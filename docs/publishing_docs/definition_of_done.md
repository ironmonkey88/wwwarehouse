# WWWarehouse: Definition of Done (DoD) 📜

No task or pipeline is considered "Done" until the following criteria are met and verified.

---

## 🧪 1. Testing (The Testing Trinity)
Every change must pass three layers of verification:

1.  **Unit Tests**: Verify isolated logic components (dbt macros, Python functions).
2.  **Functional Tests**: Verify the specific "solve" for the current task. Must use mock data for laptop-independent verification. Run via `pytest tests/functional/` — 100% pass required.
3.  **Regression Tests**: Verify that the global system state (architecture, setup, historical logic) remains intact.

## 🏛 2. The Lineage Mandate
- [ ] Every model must trace back to an **Explicit Source** in `sources.yml`.
- [ ] The `dbt docs` lineage graph must show a complete, unbroken chain from Source -> Bronze -> Silver -> Gold.
- [ ] **No Shadow Data:** Any model not connected to a final **Knowledge Product** in the lineage graph is a violation.

## 🧭 3. Service Level Agreement (SLA) & Triple-Seal Audit
- [ ] **Freshness:** Data update timestamp is < **24 hours** from the source (unless no new data is available).
- [ ] **Size (Gate 1):** Bronze record count matches the source metadata (+/- 0.01%).
- [ ] **Shape (Gate 2):** Categorical distributions must remain intact. `unique` and `not_null` tests pass for all primary keys in Silver/Gold layers.
- [ ] **Sample (Gate 3 - Moral Certainty):** A 1% random audit must reveal zero identity drift between Source and Vault.
- [ ] **Observability:** 100% of columns in the Gold layer have descriptions in `schema.yml`.
- [ ] **Visual Certification:** Every Dashboard includes a mandatory **"Proof Section"** demonstrating data correctness (Freshness, Integrity, Provenance).

## 🤖 4. Agentic Autonomy
- [ ] Self-healing logic is implemented and tested for the specific pipeline.
- [ ] A **Slack Alert** to `stonezuppe.slack.com` is triggered for both success and healing events.
- [ ] Continuous regression: every code change must not break previously functioning pipelines.

## 📦 5. Deployment & Handover
- [ ] **Sentinel Audit:** `python3 bin/focus_sentinel.py` passes with zero Critical Pollution events.
- [ ] **Architecture Check:** Any structural/tooling shift is recorded in an **ADR** with the rationale.
- [ ] **Lineage Hub:** dbt docs are updated and published.
- [ ] **Bead Close:** The tracking **Bead (bd)** is closed with a final summary of changes and the "Why."
- [ ] **Knowledge Distshake:** Non-obvious lessons are moved to `docs/KNOWLEDGE.md` and any new environment truths are hardened into `docs/SOP.md`.
- [ ] `git push` succeeded and remote is in sync.

## 🏛 6. Topology & Schema
- [ ] **ERD:** Every Silver and Gold model must be represented in the [Project ERD](file:///Users/gordonwong/WWWarehouse/docs/ERD.md).
- [ ] **Relationship Integrity:** All foreign key relationships (joins) must be explicitly diagrammed.
- [ ] **Semantic Discovery:** Every Gold model must be tagged with `tags: ["lightdash"]` in `schema.yml` and be joinable without SQL errors.

---
*Created by the Wong Way Data Factory | April 2026*
