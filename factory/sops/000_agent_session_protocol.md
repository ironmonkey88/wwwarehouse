# 🧭 SOP-000: Agent Session Protocol (How to Start)

This procedure defines the mandatory startup and shutdown sequence for every agent session in the **Wong Way Data Factory**. Following this protocol ensures context continuity, prevents repeated mistakes, and maintains a clear audit trail.

---

## 🚀 1. Session Startup (Read Order)

Every agent session begins with intentional context loading. Do not start writing code until you have completed this sequence.

1.  **Read [`AGENTS.md`](/factory/AGENTS.md)** — Your laws. Understand the 5 Laws of Sovereignty and the Agent-Human Contract.
2.  **Read [`assistant_role.md`](/factory/constitution/assistant_role.md)** — Your behavioral contract. Understand Execution Sovereignty, Cost Stewardship, and Token Efficiency.
3.  **Check [`KNOWLEDGE.md`](/artifacts/KNOWLEDGE.md)** — Avoid known pitfalls. Read the most recent dated entries for environment gotchas, tooling quirks, and lessons from prior sessions.
4.  **Check [`task.md`](/task.md)** — Understand what's in progress. Identify open items, blocked work, and the current mission.
5.  **Identify the right SOP** — Match the Conductor's request to the correct procedure:
    - Building a new data source? → [SOP-002](/factory/sops/002_assembly_line_ingestion.md)
    - Modifying dbt models? → [SOP-003](/factory/sops/003_transformation_refinery.md)
    - Creating a dashboard? → [SOP-004](/factory/sops/004_knowledge_product_plating.md)
    - Scaling infrastructure? → [SOP-007](/factory/sops/007_factory_upgradability.md)

## 🛠 2. Task Execution Lifecycle

Once context is loaded, follow this sequence for every task:

```
Claim → Plan → Build → Test → Verify → Close
```

1.  **Claim**: Open or claim a **Bead** via `bd claim` ([SOP-001](/factory/sops/001_governance_beads.md)).
2.  **Plan**: If the task is non-trivial, create an implementation plan and get Conductor approval before writing code.
3.  **Build**: Execute using the relevant SOP. Obey [Environmental Sovereignty](/factory/sops/SOP.md) — Direct Binary Pathing, Binary Stamp.
4.  **Test**: Run the **Testing Trinity** (Unit → Functional → Regression) per the [Definition of Done](/factory/sops/definition_of_done.md).
5.  **Verify**: For data pipelines, run the **Triple-Seal Audit** (Size → Shape → Sample). For UI, visual confirmation.
6.  **Close**: Complete the [Deployment & Handover checklist](/factory/sops/definition_of_done.md), including the **Knowledge Distshake** and **Bead Close**.

## 🧠 3. Session Shutdown

Before ending a session:

1.  **Update `task.md`** — Mark completed items, note blockers, leave context for the next session.
2.  **Knowledge Distshake** — If the session produced non-obvious insights, add a dated entry to [`KNOWLEDGE.md`](/artifacts/KNOWLEDGE.md).
3.  **Commit & Push** — All changes must be on the remote. No local-only work survives session boundaries.

## ⚠️ 4. Anti-Patterns (Things That Break the Factory)

| Anti-Pattern | Why It Fails | The Fix |
| :--- | :--- | :--- |
| Skipping KNOWLEDGE.md | Repeating a solved problem wastes tokens and time | Always read the latest entries before starting |
| Using `source activate` | Subshell environments don't persist across tool calls | Use `./.venv/bin/python3` directly |
| Writing `bin/` scripts without shebangs | macOS executes them as shell, not Python | Always apply the Binary Stamp |
| Assuming library versions from docs | Installed version may differ from latest docs | Check `package.json` or `pip show` first |
| Editing Tier 1 docs without approval | Constitutional changes require Conductor sign-off | Propose changes, wait for "yes" |

---
*Created by the Wong Way Data Factory | April 2026*
