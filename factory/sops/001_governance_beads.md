# 🏛 SOP-001: Factory Governance & Traceability

This procedure defines how we track work and archive decisions in the **WWWarehouse Data Factory**. Compliance is mandatory to ensure that **"Future Gordon"** can always trace the rationale behind every assembly line.

---

## 🏛 1. The Decision Archive (ADR)
Architecture Decision Records (ADRs) are the permanent record of our technical shifts.

*   **When to record**: For any change in tooling (e.g., dlt vs Airbyte), architecture (e.g., Staging Hive), or infrastructure (e.g., Cube vs dbt Metrics).
*   **Location**: `docs/adr/###_title.md`
*   **The Mandate**: No major change is "Done" until the ADR is written, summarizing:
    *   **Context**: What problem are we solving?
    *   **Decision**: What did we choose?
    *   **Rationale**: **WHY did we choose it?** (Vetting results, cost, speed).
    *   **Status**: Proposed, Accepted, Superceded.

## 🧭 2. Task Tracking (Beads)
We use the **Beads (bd)** system for decentralized, version-controlled task management.

1.  **Creation**: Every task starts as a Bead.
    ```bash
    bd create --title "Build 311 Scraper" --body "Rationale: We need rat complaint data for the equity dashboard..."
    ```
2.  **Activity Logs**: Significant decisions made *during* the work must be recorded as comments on the Bead.
    ```bash
    bd comments add <id> "Switching to dlt for this scraper because SODA API supports it natively."
    ```
3.  **The "Done" Summary**: When closing a Bead, you must summarize what was accomplished and "Why" it meets the DoD.
4.  **The Knowledge Distshake**: For major milestones, you MUST perform a **Knowledge Distshake**—moving non-obvious lessons into `docs/KNOWLEDGE.md` and hardening any new environment truths into `docs/SOP.md`. 🧠🛡️

## 📜 3. Code-Level Traceability
*   **dbt Descriptions**: Every model and critical column in `schema.yml` must have a description explaining its business logic.
*   **Lineage**: The `dbt docs` lineage graph is the source of truth for data flow. Shadow tables (disconnected from lineage) are prohibited.

---
*Created by the Wong Way Assistant | April 2026*
