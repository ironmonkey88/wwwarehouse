# ADR-005: The Qualified Worker Standard

## Status
Proposed (2026-04-11)

## Context
In the **Agentic Foundry**, agent performance is currently high-variance because "Modes" (Personas) are defined by behavioral intent but lack a strict contract of capability. When an agent adopts a mode, there is no verification that the specific tactical tools (Skills) required for that role are available or loaded. This leads to "Agentic Drift," where an agent attempts a task (e.g., dbt modeling) without applying the project's specific standards (e.g., the `dbt-analytics` skill).

## Decision
We will implement the **Qualified Worker Standard**. Every agent mode MUST be defined by three explicit pillars bound together in the machine-readable `MODE.yaml`:
1.  **Identity (Role)**: The behavioral intent and constraints.
2.  **Skills (Capabilities)**: A mandatory list of `requiredSkills` (pointers to `factory/skills/*/SKILL.md`) that the agent must verify at session start.
3.  **Objectives (KPIs)**: Explicit targets the persona is held accountable for (e.g., "Zero undocumented architecture shifts" for the Architect).

### Structural Requirement
The `MODE.yaml` schema is upgraded to include:
```yaml
content: |
  slug: [name]
  requiredSkills:
    - [skill-slug-1]
    - [skill-slug-2]
  objectives:
    - [objective-1]
```

## Rationale
-   **Predictability**: By verifying skills at startup via `bin/verify_worker.py`, we prevent logic errors before they occur.
-   **Upskillability**: To "Upskill" a worker, the Architect must either give them a new Skill or refine their Objectives in the Registry.
-   **Portability**: This pattern keeps the workers "Laptop Independent" by ensuring their logic is in the repo, not the orchestrator's system prompt.

## Consequences
-   **Positive**: Increased reliability and auditability of agentic work.
-   **Negative**: Slight overhead at session start (startup validation).
-   **Mitigation**: The `verify_worker.py` script will be optimized for sub-second execution.
