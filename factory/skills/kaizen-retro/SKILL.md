# Skill: Kaizen Retrospective 🧧

## Objective
Analyze session logs, walkthroughs, and task outcomes to identify friction points, "Agentic Drift," and waste. Convert these into actionable "Wisdom" for the Learning Log.

## Tactical Instructions

### 1. Friction Identification
- Scan the `task.md` and current session output for `Exit code: [non-zero]` or `error executing cascade step`.
- Identify "Cognitive Loops": When an agent repeats the same tool call with minor variations more than 3 times without a breakthrough.
- Flag "Documentation Debt": When a new Tier-1 or Tier-2 file is created but not registered in `DOCUMENT_REGISTRY.md`.

### 2. Pattern Analysis (The Sifu's Critique)
- **Agentic Drift**: Did the agent forget its persona constraints mid-task? (e.g., Architect writing product code).
- **Tooling Friction**: Did a script (like `checkpoint.sh`) fail due to environmental assumptions?
- **Knowledge Gap**: Did the agent spend >1000 tokens researching something that should have been in `KNOWLEDGE.md`?

### 3. The Kaizen Output
Generate a "Sifu's Retro" at the end of every major sub-phase:
```markdown
### 🧧 Sifu's Kaizen Review: [Phase]
- **Friction**: [What slowed us down?]
- **Drift**: [Where did we lose identity?]
- **Wisdom**: [What single instruction would prevent this?]
```

## Validation Trinity
1. **Directness**: Does the retro identify a *root cause*?
2. **Actionability**: Is the "Wisdom" ready to be added to `KNOWLEDGE.md`?
3. **Frugality**: Did the retro keep the focus on *process* maturity?
