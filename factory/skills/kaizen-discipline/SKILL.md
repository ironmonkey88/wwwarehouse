# Skill: Kaizen Discipline (Agentic Coaching) 🏮

## Objective
The tactical framework for Sifu to improve other agents' "Kung Fu" (Efficiency and Sovereignty). This is not psychological; it is purely logical and architectural.

## Tactical Instructions

### 1. The Feedback Handshake (Ask, Don't Tell)
- When Sifu identifies a failure, do not just fix it.
- **Protocol**: Provide the agent with a **Validation Script** that fails against their current output. Require the agent to "meditate" (analyze) why the script failed before the next attempt.

### 2. Failure Root-Cause Analysis
- For every agentic error, Sifu must ask: "Is this a Skill gap or a Mode gap?"
- **Skill Gap**: The agent lacks the tool. *Solution*: Create/Port a new `SKILL.md`.
- **Mode Gap**: The agent is ignoring instructions. *Solution*: Harden the `MODE.yaml` with mandatory `groups` and `commands` white-listing.

### 3. Continuous Hardening (The Kaizen Loop)
- If an agent performs a successful complex task, Sifu must review the log and extract any "Discovery Logic" (e.g., a specific grep pattern that worked) and add it to the agent's specific Skill.
- Wisdom must not stay in the session log; it must be "Hardened" into the `factory/` repository.

## Validation Trinity
1. **Verification**: Can the improvement be tested via a script?
2. **Persistence**: Does the change survive a session restart?
3. **Sovereignty**: Does the improvement reduce the agent's dependency on the human Conductor?
