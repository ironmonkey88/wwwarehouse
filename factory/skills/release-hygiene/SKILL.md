# Skill: Release Hygiene (The Handover) 🛰️

## Objective
Ensure the repository is in a 'Hardened' state before pushing to GitHub.

## Tactical Instructions

### 1. Secret Sanitization
- Scan the diffs for leaked hardcoded credentials (API keys, MotherDuck tokens).

### 2. Lint & Format
- Ensure all dbt models are formatted and YAMLs are valid.
- MUST run 'bin/checkpoint.sh'.
