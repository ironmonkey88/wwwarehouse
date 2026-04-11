# Skill: ADR Governance 🏛️

## Objective
Standardize the creation, vetting, and lifecycle of Architecture Decision Records (ADRs) within the WWWarehouse.

## Tactical Instructions

### 1. The Context Mandate
- NEVER propose a decision without a "Context" section that includes at least one specific friction point or failure case from the `KNOWLEDGE.md`.
- Use the "Occam's DWH" principle: If a simpler, file-based solution exists, reject the complex one.

### 2. The Decision Standard
- Every ADR must include an "Alternatives Considered" section.
- Decisions must explicitly address "Laptop Independence." If a decision requires a local binary installation, it must be scripted in `bin/setup_mac.sh`.

### 3. Vetting the Switch
- When status moves from 'Proposed' to 'Accepted', the agent must update the `DOCUMENT_REGISTRY.md` immediately if any new Tier-1 or Tier-2 files are created.

## Validation Trinity
1. **Size**: Is the document <500 words? (Brevity is Sovereignty).
2. **Shape**: Does it follow the MADR (Markdown ADR) format?
3. **Sample**: Can a fresh agent read this and understand the *Why* without reading conversation logs?
