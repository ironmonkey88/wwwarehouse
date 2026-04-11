# Skill: Test-Driven Design (Architectural TDD) 🏛️

## Objective
Enforce the "Design for Testability" mandate across the entire factory architecture.

## Tactical Instructions

### 1. Structural Mandates
- No new practitioner module or ingestion script may be created without a corresponding `tests/` directory and a base-case test.
- Every ADR-level decision must include a "Verification Handshake" section (DoD).

### 2. Contract Verification
- Architecture must ensure that the "Output" of one specialist (e.g., Assembler) matches the "Input" expectations of the next (e.g., Refiner).
- Use dbt unit tests and Python type-hinting as architectural guards.

### 3. Framework Selection
- Mandate the use of `dbt-unit-testing`, `pytest`, and `SOP-004` (Visual DQ) as project-wide standards.
- Reject any implementation that bypasses the "Proof Section."
