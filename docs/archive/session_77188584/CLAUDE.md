# CLAUDE.md: Agent Operational Guidelines 🤖

This file serves as a high-density operational anchor for AI agents working in the **Wong Way Warehouse**.

## 🏛 Context
This is a **Sovereign Data Factory** built on the **Medallion Architecture** using Python, dbt, and DuckDB. It is governed by the **Frugal Agentic Stack (2026)**.

## 🛠 Tooling & Commands
- **Governance**: `bd list`, `bd claim <id>`, `bd close <id>`.
- **Infrastructure**: `terraform init/plan/apply` in `infra/terraform/`.
- **Logic**: 
    - Ingestion: `councilor_ingest.py` (dlt).
    - Refinery: `dbt run` in `transformation/dbt/`.
- **Verification**: `bin/triage.sh`.
- **The Auditor**: `roborev tui` (Review queue).
- **The Worker**: `bin/polecat.sh "[task]" [file]` (Local delegation).

## 🧭 Methodology
- **Frugal Delegation**: Use `bin/polecat` for boilerplate, unit tests, and formatting to save cloud tokens.
- **Sovereignty**: No secrets in git. Use `.env` or GCP Secret Manager.
- **Quality**: Follow the **Testing Trinity** (Unit, Functional, Regression).
- **Zero-Idle**: Optimize for local execution; use Cloud Run for scheduled jobs.
- **Workflow**: Never push to `master`. Work in `feat/` branches and present a PR Summary.

## 📦 File Layout
- `/docs`: ADRs, SOPs, and historical reports.
- `/.beads`: Task ledger (Sovereign Memory).
- `/.agent/skills`: Modular agent logic.
- `/infra`: Terraform foundation.
