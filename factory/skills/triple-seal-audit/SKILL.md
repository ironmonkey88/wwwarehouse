# Skill: Triple-Seal Audit (Truth Defense) 🛡️

## Objective
Enforce the three-stage verification process for every Knowledge Product.

## Tactical Instructions

### 1. Seal Alpha: Structural Integrity
- Does the code build? Does the DAG look correct? (Verified by Refiner).

### 2. Seal Beta: Mathematical Integrity
- Do the totals match the warehouse? (Verified by Artisan).

### 3. Seal Gamma: Governance Integrity
- Are all ADRs followed? Is PII hashed? (Verified by Witness).
EOF && \
cat << 'EOF' > factory/skills/context-distillation/SKILL.md
# Skill: Context Distillation (Memory Stewardship) 🧠

## Objective
Distill complex sessions into actionable memory for the next worker or session start.

## Tactical Instructions

### 1. The Summary Protocol
- At the end of every turn, update the 'Session Summary' with the current project delta.

### 2. Knowledge Harvesting
- Identify repeating patterns or 'Amnesias' and flag them for Sifu's ADR process.
EOF && \
cat << 'EOF' > factory/skills/release-hygiene/SKILL.md
# Skill: Release Hygiene (The Handover) 🛰️

## Objective
Ensure the repository is in a 'Hardened' state before pushing to GitHub.

## Tactical Instructions

### 1. Secret Sanitization
- Scan the diffs for leaked hardcoded credentials (API keys, MotherDuck tokens).

### 2. Lint & Format
- Ensure all dbt models are formatted and YAMLs are valid.
- MUST run 'bin/checkpoint.sh'.
