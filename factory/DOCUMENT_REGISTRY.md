# WWWarehouse Document Registry 📚

Every document in this project has a defined purpose, scope, and audience. If a document is not listed here, it is either an artifact of a dependency or needs to be registered.

**Rule:** Before creating a new document, check this registry. If the content belongs in an existing document, put it there.

---

## 🏛 Tier 1: The Constitution (Internal Law)

These documents govern agent behavior and project identity.

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **manifesto.md** | `/factory/constitution/manifesto.md` | The "Wong Way" vision | Zero-Idle, Decision Archiving | All |
| **philosophy.md** | `/factory/constitution/philosophy.md` | Tactical principles | Token Hygiene, Steel Thread | All |
| **assistant_role.md** | `/factory/constitution/assistant_role.md` | Behavioral contract | Execution Sovereignty | All |

---

## 🛠 Tier 2: Standard Operating Procedures (How We Work)

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **SOP-000** | `/factory/sops/000_agent_session_protocol.md` | Session Lifecycle | Start/Shutdown checklist | Every Session |
| **SOP-001** | `/factory/sops/001_governance_beads.md` | Task tracking | ADR/Bead protocol | Every Task |
| **SOP-002** | `/factory/sops/002_assembly_line_ingestion.md` | Ingestion (dlt) | Python-Native ELT | Assembler |
| **SOP-003** | `/factory/sops/003_transformation_refinery.md` | Transformation (dbt) | Medallion standards | Refiner |
| **SOP-004** | `/factory/sops/004_knowledge_product_plating.md` | Plating (BI) | Proof Section (Evidence) | Artisan |
| **SOP-005** | `/factory/sops/005_wong_way_sdlc.md` | The Pulse (SDLC) | Phase Gates 0-5 | Mayor/Architect |
| **SOP-007** | `/factory/sops/007_factory_upgradability.md` | Scaling Logic | MotherDuck/BigQuery paths | Architect |
| **SOP-008** | `/factory/sops/008_sovereign_async_execution.md` | Long-Running Tasks | Log redirection | All |

---

## 🎭 Tier 3: The Specialized Swarm (Identity & Capability)

| Category | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **Practitioners** | `/factory/modes/` | Role Definitions | YAML YAML Activation files | Sifu / Mayor |
| **Tactical IQ** | `/factory/skills/` | Skill Modules | Machine-readable instructions | All |
| **Blueprints** | `/factory/templates/` | Reusable Patterns | Requirement/Lesson templates | Mayor / Sifu |

---

## 🧪 Tier 4: Quality & Memory (What We Know)

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **Definition of Done** | `/docs/definition_of_done.md` | Acceptance Checklist | Testing Trinity, SLA Seal | Every Task |
| **KNOWLEDGE.md** | `/artifacts/KNOWLEDGE.md` | Deep Memory | Insights and Environment Fixes | Every Session |
| **ADR Registry** | `/artifacts/adr/` | Decision Archiving | Rationale for Architecture | Architect |

---

## 🏗 Tier 5: Architecture & Roadmap (The Map)

| Document | Location | Purpose | Contains | Used By |
| :--- | :--- | :--- | :--- | :--- |
| **Master Plan** | `/docs/master_plan.md` | Project Roadmap | Phase Milestones | All |
| **Architecture** | `/docs/architecture_design.md` | System Layout | ZIST stack diagram | Onboarding |
| **ERD** | `/docs/ERD.md` | Data Model ERD | Dimensional catalog | Refiner |
| **Task Log** | `/task.md` | Current TODO | Live session items | All |

---
*Maintained by the Wong Way Data Factory | April 2026*
