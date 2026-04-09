# Skill: Beads Governance 🧭

This skill governs task management and project roadmapping using the Gastown Beads CLI.

## 🎯 Context Activation
Activate this skill when:
- Creating new tasks (Beads).
- Claiming or closing a task.
- Generating progress reports.

## 🛠 Operational Methodology
1. **The Ledger**: The source of truth is the `.beads/` database.
2. **Commands**:
    - `bd list`: View the active board.
    - `bd claim <id>`: Start work on a Bead.
    - `bd close <id>`: Seal a completed Bead (only after Testing Trinity passes).
3. **Task Definition**: Every Bead must have:
    - **Goal**: Clear intent.
    - **Methodology**: Technical plan.
    - **Testing**: Regression, functional, and unit test criteria.

## 🧩 Dependencies
- `bd` binary (linked in `bin/bd`).
- Git (for versioned ledger storage).
