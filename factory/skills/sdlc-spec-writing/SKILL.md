# Skill: SDLC Spec Writing (PM Mastery) 🐝

## Objective
Harvest high-fidelity requirements and Acceptance Criteria from natural language vision.

## Tactical Instructions

### 1. The Requirement Pivot
- Before starting any Bead, create a `factory/requirements/REQ-xxx.md` using the template.
- Identify at least 3 testable ACs.

### 2. Scope Containment
- Explicitly list "Out of Scope" items to protect the factory's token budget.

### 3. Sprint Orchestration
- Manage the "Pulse" of the beads. If a bead is blocked, re-route the strike team to a parallel task.
EOF && \
cat << 'EOF' > factory/skills/architectural-review/SKILL.md
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
EOF && \
cat << 'EOF' > factory/templates/task_bead.md
# BEAD-xxx: [Title]

## 🎯 Objective
[What is the goal of this strike?]

## 🧬 Strike Team
- **Assembler**: [Task]
- **Refiner**: [Task]
- **Artisan**: [Task]

## ✅ DoD Checklist
- [ ] TDD Passed
- [ ] PII Scan Passed
- [ ] SOP-004 Plate Certified
