# REQ-WWWarehouse-92d: Agency Capability Upgrade (Workforce Uplift) 🏮

## 🎯 Description
Hardening the Wong Way Agency by implementing mechanized SDLC gates, role-certified worker handshakes, and machine-validated requirements-as-code. This project eliminates "SDLC Theater" by ensuring all engineering work follows hard technical guardrails.

## ✅ Acceptance Criteria
- [x] AC-1: Implement the "Qualified Worker" handshake in `bin/verify_worker.py` (Bead 01).
- [x] AC-2: Implement mechanized SDLC "Guardrails" in `bin/checkpoint.sh` (Bead 02).
- [x] AC-3: Create the `bin/seal` tool for Triple-Seal Witness audits (Bead 02).
- [ ] AC-4: Formalize "Requirements-as-Code" with a validation gate (`bin/validate_spec.py`).
- [ ] AC-5: Integrate the Mayor's Requirement Gate into the checkpoint protocol.

## 🚫 Out of Scope
- [ ] Product-level development on the Civic Pulse portal.
- [ ] Upgrading the `bd` Go binary (managed upstream).

## 🛡️ Verification Gate
- [ ] **Alpha** (Structural): All `bin/` tools must exist and have functional help menus.
- [ ] **Beta** (Quantitative): 0 bypasses allowed for uncertified modes or unsealed beads.
- [ ] **Gamma** (Governance): ADR-005 and Conventions updated and physically enforced.

## ✍️ Sign-off
- **Manager**: Gordon Wong
- **Persona**: The Mayor
- **Seal**: `Signed-by: Gordon Wong`

## ❓ Open Questions
- [ ] Should we implement automated "Lesson Harvesting" in Bead 04?
