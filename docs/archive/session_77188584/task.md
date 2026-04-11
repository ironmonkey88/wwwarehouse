# Task: ERD Sovereignty & DoD Hardening 🛡️

Implementing the "Topology Seal" to ensure all data models are mapped in the project ERD.

## High-Level Tasks
- [x] **CP-G01: Update DoD** ([definition_of_done.md](docs/definition_of_done.md))
- [x] **CP-G02: Initialize Project ERD** ([docs/ERD.md](docs/ERD.md))
- [/] **CP-G03: Link ERD to Master Plan** ([docs/master_plan.md](docs/master_plan.md))
- [x] **CP-G04: Update DoD for Accessibility** ([docs/definition_of_done.md](docs/definition_of_done.md))
- [/] **CP-G05: Enhance Documentation Hub** ([bin/publish_docs.sh](bin/publish_docs.sh))
- [ ] **CP-G06: Lightdash Discovery Tags** ([transformation/dbt/models/schema.yml](transformation/dbt/models/schema.yml))

## Sub-Tasks
### 🏛 1. Governance Update
- [x] Add Section 5 (Topology Seal) to DoD.
- [x] Add Section 6 (Lightdash Discovery) and Section 7 (Public Portal) to DoD.

### 🧭 2. Documentation Setup
- [x] Create `docs/ERD.md`.
- [x] Document `stg_councilors` entity.
- [/] Update `bin/publish_docs.sh` to include ERD.md.

### 🤖 3. Automation & Verification
- [ ] Tag `stg_councilors` for Lightdash in `schema.yml`.
- [ ] Run `focus_sentinel.py` to verify documentation integrity.
