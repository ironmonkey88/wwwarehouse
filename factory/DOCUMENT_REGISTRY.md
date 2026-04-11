# WWWarehouse Document Registry 📚

Every document in this project has a defined purpose, scope, and audience. If a document is not listed here, it is either an artifact of a dependency or needs to be registered.

**Rule:** Before creating a new document, check this registry. If the content belongs in an existing document, put it there.

---

## 🏛 Tier 1: The Constitution (Internal Law)

These documents govern agent behavior and project identity. They are **never** shared externally. Deleting any of these degrades factory operations.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **AGENTS.md** | `/factory/AGENTS.md` | Laws of Sovereignty for all AI agents | The 5 Laws, Agent-Human Contract, Handshake Protocol, Remote Sovereignty | Every agent, every session — read first |
| **manifesto.md** | `/factory/constitution/manifesto.md` | The "Wong Way" vision and core principles | Zero-Idle mandate, Upgradability paths, Staging Hive pattern, Decision Archiving philosophy | Strategic decisions, architecture reviews |
| **philosophy.md** | `/factory/constitution/philosophy.md` | Development values and tactical principles | Vibe Chaining, Occam's DWH, Steel Thread, Theory of Constraints, Token Hygiene | Day-to-day development choices |
| **assistant_role.md** | `/factory/constitution/assistant_role.md` | Agent behavioral contract and responsibilities | Complexity Vetting, Cost Stewardship, Execution Sovereignty, Technical Vetting, Token Efficiency | Every agent — defines how to behave |

---

## 🛠 Tier 2: Standard Operating Procedures (How We Work)

These documents define mandatory processes. They are the "playbook" that ensures consistency across agents and sessions.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **SOP.md** | `/factory/sops/SOP.md` | Master index of all SOPs | Links to all SOP-00x files, Environmental Sovereignty standards | Quick-reference entry point for any process question |
| **SOP-000** | `/factory/sops/000_agent_session_protocol.md` | Agent session startup, lifecycle, and shutdown | Read order, task lifecycle (Claim→Plan→Build→Test→Verify→Close), anti-patterns | Every session — the first thing any agent reads |
| **SOP-001** | `/factory/sops/001_governance_beads.md` | Task tracking and decision archiving | ADR protocol, Beads workflow, Knowledge Distshake closure step | Every task — defines "how to start" and "how to close" |
| **SOP-002** | `/factory/sops/002_assembly_line_ingestion.md` | Building data ingestion pipelines | dlt init workflow, Binary Stamp requirement, Direct Binary Pathing | When commissioning a new data source |
| **SOP-003** | `/factory/sops/003_transformation_refinery.md` | dbt Medallion transformation layer | Bronze/Silver/Gold standards, Lineage Mandate | When building or modifying dbt models |
| **SOP-004** | `/factory/sops/004_knowledge_product_plating.md` | Building dashboards and BI deliverables | Evidence.dev/Lightdash standards, mandatory Proof Section | When creating a Knowledge Product |
| **SOP-005** | `/factory/sops/005_sovereign_async_execution.md` | Long-running task management | Async protocol, log redirection, tracking | When jobs take >30 seconds |
| **SOP-007** | `/factory/sops/007_factory_upgradability.md` | Scaling from serverless to dedicated | Upgrade paths (DuckDB -> MotherDuck -> BigQuery) | When a component hits capacity limits |

---

## ⚡ Tier 2.5: Agentic Skills (Tactical Execution)

These are machine-readable prompt files loaded dynamically by the Cloud AI into context. They dictate exact execution parameters.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **create-pull-request** | `/factory/skills/create-pull-request/SKILL.md` | Flawless GitHub PR generation | Git auth checks, temp file body generation | The Refinery |
| **dbt-analytics** | `/factory/skills/dbt-analytics/SKILL.md` | Analytics engineering directives | Lineage rules, TDD mocks, troubleshooting loops | The Coder, The Debugger |
| **bi-delivery** | `/factory/skills/bi-delivery/SKILL.md` | BI and Dashboard standards | Evidence.dev and Lightdash components, Proof Section | The Lookout |

---

## 🎭 Tier 3.5: Agentic Identity (Modes)

These documents define the "personhood" of agents. They are machine-readable YAML files that dictate internal monologue and behavioral constraints.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **Agent Registry** | `/factory/modes/README.md` | Governance standards for personas | Kilo schema definition, activation protocol | Every agent at session start |
| **Mode Template** | `/factory/modes/template.yaml` | The blueprint for new personas | Required YAML fields, roleDefinition | The Architect (when commissioning agents) |

---

## 🧪 Tier 3: Quality & Standards (What "Done" Means)

These documents define acceptance criteria and quality gates.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **definition_of_done.md** | `/factory/sops/definition_of_done.md` | Comprehensive DoD checklist | Testing Trinity, Lineage Mandate, SLA, Agentic Autonomy, Deployment, Topology Seal, Knowledge Distshake | Every task — the final checklist before closing a Bead |
| **quality_lab.md** | `/artifacts/quality_lab.md` | Living record of TDD results and handshakes | Timestamped test results, verification proofs | Post-milestone certification |

> **Note:** `quality_standards.md` was consolidated into `definition_of_done.md` to eliminate overlap. The file now contains a pointer.

---

## 🧠 Tier 4: Memory & Learning (What We Know)

These documents capture institutional knowledge and prevent us from repeating mistakes.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **KNOWLEDGE.md** | `/artifacts/KNOWLEDGE.md` | Continuous Learning Log ("Deep Memory") | Dated insights, gotchas, environment discoveries | Every session start — check before researching |
| **ADRs** | `/artifacts/adr/###_title.md` | Architecture Decision Records | Context, Decision, Rationale, Status for each major shift | When questioning "why did we choose X?" |
| **Retrospectives** | `/artifacts/retrospectives/RETROSPECTIVE_*.md` | Post-mortem analysis of completed phases | Root causes, friction inventory, corrective actions | After major milestones |

---

## 🏗 Tier 5: Architecture & Planning (What We're Building)

These documents describe the system's structure and roadmap.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **architecture_design.md** | `/docs/architecture_design.md` | System design and technical stack | ZIST stack, HLD diagram, Medallion methodology, Cloud Sovereignty, Agentic Self-Healing | Onboarding, architecture reviews |
| **master_plan.md** | `/docs/master_plan.md` | Phased roadmap with detailed task breakdown | Phase 0-5 milestones, validation gates, dependency manifest, Beads task list | Sprint planning, progress tracking |
| **ERD.md** | `/docs/ERD.md` | Entity Relationship Diagram | Mermaid schema diagrams, relationship catalog | When adding/modifying data models |
| **asset_registry.md** | `/docs/asset_registry.md` | Infrastructure inventory and credentials map | GCP resources, domains, Slack channels, tooling versions | Environment setup, debugging |
| **task.md** | `/task.md` | Living TODO for the active agent session | Current checklist of in-progress and pending work items | Every session — immediate context |

---

## 🛰 Tier 6: External / Publishing (What Others See)

These documents are outward-facing. They can be deleted without impacting internal operations.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **AGENTIC_APP_BLUEPRINT.md** | `/AGENTIC_APP_BLUEPRINT.md` | External reconstruction guide | Environment spec, tech stack, quality gates, data standards — everything an external party needs to rebuild the factory | External consultants, portfolio review |
| **Walkthroughs** | `/docs/WALKTHROUGH.md`, `/docs/publishing_docs/walkthrough_*.md` | Narrative proofs of completed work | Phase completion assessments, principle alignment | External review, portfolio |

---

## ⚠️ Document Hygiene Rules

1. **No orphan documents.** Every `.md` in `docs/` must appear in this registry.
2. **No content duplication.** If the same concept exists in two places, consolidate into the higher-tier document and link from the lower.
3. **Tier 1 is read-only for agents.** Agents may propose changes to Tier 1 docs but must get Conductor approval before editing.
4. **The Knowledge Distshake.** After every major milestone, lessons from walkthroughs/retros must be distilled into `KNOWLEDGE.md` (Tier 4) and hardened into SOPs (Tier 2) if they represent repeatable standards.

---
*Maintained by the Wong Way Data Factory | April 2026*
