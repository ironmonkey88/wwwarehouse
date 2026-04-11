# Agentic Modes Registry 🎭

This directory contains formal definitions for all artificial agents operating within the **Wong Way Data Factory**. 

Following the **Kilo Marketplace Standard**, each mode (persona) is defined by a `MODE.yaml` file located in a subdirectory (e.g., `factory/modes/lookout/MODE.yaml`).

## 📐 Schema Standard (template.yaml)

All modes MUST adhere to the schema defined in `template.yaml`. This schema enables machine-readability and strict behavioral enforcement.

### Key Fields:
- **id**: Unique kebab-case identifier (e.g., `bi-analyst`).
- **name**: Human-readable persona name.
- **description**: High-level summary of the persona's role.
- **content**: A nested YAML block scalar (`|`) containing:
    - **roleDefinition**: The "Inner Monologue" of the agent.
    - **groups**: Constrained capability groups (e.g., `dbt-analytics`).
    - **customInstructions**: Hard behavioral rules (SOP alignment).

## 🚀 Activation Protocol
As per **SOP-000**, an agent MUST explicitly "Activate" its mode at the start of every session by reading its corresponding `MODE.yaml`.
