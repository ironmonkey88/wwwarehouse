# Skill: Architectural Review (Phase Gate Control) 🏛️

## Objective
Enforce the technical integrity of every SDLC phase, ensuring structural logic is never bypassed.

## Tactical Instructions

### 1. Phase Gate Audit
- During 'Phase 2: DESIGN', vet the proposed strike team tasks against existing ADRs.
- Reject any design that introduces "Shadow Dependencies."

### 2. Context Stewardship
- Ensure the project context remains synced for every practitioner.
- Use 'bin/verify_worker.py' as a mandatory gate for any sub-agent commissioning.
