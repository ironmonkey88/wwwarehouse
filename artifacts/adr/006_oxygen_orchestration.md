# ADR 006: Integration of Oxygen (Oxy.tech) 🏮

## Status
Proposed -> Approved (Retroactive Recovery)

## Context
The WWWarehouse requires a "High-Level Intelligence Layer" to orchestrate complex agentic workflows, semantic modeling, and data delivery. While dbt and DuckDB handle the "Refinement" of raw data, a specialized platform is needed to manage the "Agent-Native" orchestration of data products.

## Decision
We are integrating **Oxygen (Oxy.tech)** as our Sovereign Intelligence Layer. 

### Why Oxygen?
- **Agent-Native**: Designed specifically for Agentic reasoning and Large Analytics Models (LAM).
- **Orchestration**: Simplifies multi-step workflows (Procedures) across the Medallion layers.
- **Semantic Mastery**: Provides a unified layer that integrates with Lightdash and Evidence.

## Implications
- **Tooling**: Oxygen will be the primary high-level orchestrator above dbt.
- **Maintenance**: Architect must ensure Oxygen's "Procedures" are documented and portable.
- **Sovereignty**: Oxygen must be configured to respect the factory's "Laptop Independence" mandate where possible (or serve as the cloud-bridge).

## Validation Handshake
- **Architect/Sifu**: Record "Oxygen" in the technology matrix.
- **Verify**: Architect must vet Oxygen's integration for "Frugality" (Cycle 3 Audit).
