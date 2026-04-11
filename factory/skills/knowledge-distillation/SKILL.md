# Skill: Knowledge Distillation 🧠

## Objective
Convert ephemeral session insights into "Deep Memory" by pruning, hardening, and updating the project's `KNOWLEDGE.md` and `ADR` artifacts.

## Tactical Instructions

### 1. Verification of Truth
- Only move insights into `KNOWLEDGE.md` if they have been verified by a `[x] Success` output in the current task.
- Avoid "Maybe" knowledge. If an environment variable *might* be needed, keep it in the session log; if it *must* be set, add it to `KNOWLEDGE.md`.

### 2. Pruning the Bloat
- Every 5 entries in `KNOWLEDGE.md`, review the entire file for redundancy.
- Consolidate similar "Gotchas" into a single "Standard Practice."
- Ensure all entries have a `[Phase/Bead ID]` for traceability.

### 3. Hardening the SOP
- If a piece of knowledge is referenced more than 3 times in a single phase, Sifu must recommend it be "hardened" into a Tier-2 SOP.

## The Output Protocol
When updating `KNOWLEDGE.md`, use the following structure:
```markdown
## [YYYY-MM-DD] [Worker ID] [Topic]
- **Context**: [The Friction Point]
- **Insight**: [The Solution]
- **Action**: [How to avoid/repet] [Link to SOP if applicable]
```

## Validation Trinity
1. **Searchability**: Is the entry discoverable via a simple keyword grep?
2. **Longevity**: Will this knowledge be valid when we upgrade the stack (e.g., DuckDB -> MotherDuck)?
3. **Frugality**: Does the entry save the agent at least 500 tokens of research in the next session?
