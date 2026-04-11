# Skill: Agentic Critique (Token Optimizer) 🏮

## Objective
Optimize other agents' instructions by pruning "vibe-based" bloat and replacing it with verifiable constraints. Maximize Instruction Density within the context window.

## Tactical Instructions

### 1. The Pruning Audit (Vibe Detection)
- Search `MODE.yaml` and `SKILL.md` files for "Vague Attributes": 
  - *Vague*: "Write clean code", "Be efficient", "Ensure robustness".
  - *Qualified (Replace with)*: "Maintain <3 cyclomatic complexity", "Run dbt compile before completion", "Verify output via validator.py".
- If an instruction does not provide an explicit **Handshake** (check/test/script), it is noise. Delete it.

### 2. Context Economics (Progressive Disclosure)
- Every agent's core instruction set (the root file) should be <1000 tokens. 
- If a category (e.g., "Testing Standards") exceeds 20 lines, the Sifu must move it to a dedicated `SKILL.md` and replace the root section with a single link.

### 3. Loop Analysis
- Analyze session logs for "Cognitive Loops": When an agent tries the same failed tool call with the same parameters.
- **Sifu's Resolution**: Generate a `scripts/` utility that handles the flaky logic deterministically and bind it to the agent's mode.

## Validation Trinity
1. **Density**: Does the instruction set contain >80% actionable verbs?
2. **Sovereignty**: Does the agent have the *physical tool* needed to follow the instruction?
3. **Frugality**: Did the critique save >10% of the agent's baseline context load?
