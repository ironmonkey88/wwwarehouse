# Artifact Inventory

This registry catalogs the standard artifacts produced by the WWWarehouse Data Factory, alongside their purpose and the versioned template that governs them.

| Artifact | Purpose | Template Path | Storage Path | Primary Author |
| :--- | :--- | :--- | :--- | :--- |
| **ADR** | Architecture Decision Record: permanently records major architectural/tooling changes and the rationale behind them. | `factory/templates/adr_v1.md` | `artifacts/adr/` | Architect / Swarm |
| **Retrospective** | Phase/Milestone post-mortem: records what went well, friction points, and actionable improvements. | `factory/templates/retrospective_v1.md` | `artifacts/retrospectives/` | Swarm |
| **TDD Gate** | Quality Lab result: records the input, expected output, and actual outcome of a test-driven feature development. | `factory/templates/tdd_gate_v1.md` | `artifacts/quality_lab.md` | Swarm (Polecat role) |
| **Knowledge Distshake** | Continuous Learning Log entry: captures granular environmental gotchas and non-obvious lessons. | `factory/templates/knowledge_distshake_v1.md` | `artifacts/KNOWLEDGE.md` | Swarm |
| **Proof Section** | Visual Certification footer for all Knowledge Products: proves data freshness, integrity, and provenance. | `factory/templates/proof_section_v1.md` | (Appended to Dashboards) | Swarm |
