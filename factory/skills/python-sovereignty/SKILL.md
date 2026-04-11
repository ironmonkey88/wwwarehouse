# Skill: Python Sovereignty (Portable Binaries) 🐍

## Objective
Guarantee absolute portability and reliability of Python code across all environments.

## Tactical Instructions

### 1. Binary Integrity
- EVERY script must start with '#!/usr/bin/env python3'.
- NEVER refer to '/usr/local/bin/python' or similar absolute paths.

### 2. Isolation (Virtualenvs)
- Use a local '.venv' for every major ingestion module.
- Requirements MUST be exported to 'requirements.txt' with pinned versions ('pkg==1.2.3').

### 3. Execution Sovereignty
- Logs MUST be redirected to 'logs/ingestion.log' or streamed with structured metadata.
- Use 'argparse' for all CLI overrides; no hardcoded 'modes' in the code.

## Validation Handshake
- **Handshake**: Run 'bin/check_laptop_leaks.sh' on the script to ensure no path leaks exist.
