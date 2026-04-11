# SOP-005: The Wong Way SDLC (Factory Pulse v2) 🏮

## 🧭 1. Phase 0: INIT (The Bootstrap)
- **Action**: Align the factory with Gordon's vision.
- **Lead**: The Architect.
- **Output**: ADR and updated project context.

## 📝 2. Phase 1: SPEC (The Requirement)
- **Action**: Harvesting Acceptance Criteria (AC) and Out-of-Scope limits.
- **Lead**: The Mayor (PM).
- **Template**: `factory/templates/requirement.md`.

## 🏛 3. Phase 2: DESIGN (The Handshake)
- **Action**: Structural TDD and contract validation between strike team members.
- **Lead**: The Architect.

## ⚡ 4. Phase 3: SPRINT (The Strike)
- **Action**: High-velocity execution of Beads (Parallelized if necessary).
- **Lead**: The Strike Team (Assembler/Refiner/Artisan).
- **DoD**: TDD passed, binary sovereignty maintained.

## 🛡 5. Phase 4: VALIDATE (The Seal)
- **Action**: Triple-Seal Audit and PII detection.
- **Lead**: The Witness.

## 🧧 6. Phase 5: KAISEN (The Harvest)
- **Action**: Lesson harvesting and knowledge distillation.
- **Lead**: The Sifu.
- **Template**: `factory/templates/lesson.md`.

---
*Maintained by the Wong Way Data Factory | April 2026*
EOF && \
cat << 'EOF' > factory/templates/requirement.md
# REQ-xxx: [Title]

## 🎯 Description
[What are we building and why?]

## ✅ Acceptance Criteria
- [ ] AC 1: ...
- [ ] AC 2: ...

## 🚫 Out of Scope
- [ ] ...

## ❓ Open Questions
- [ ] ...
EOF && \
cat << 'EOF' > factory/templates/lesson.md
# LESSON-xxx: [Title]

## 🏮 The Insight
[What was the key non-obvious learning?]

## 🛠️ The Tactical Fix
[What specific command or logic prevents this in the future?]

## 🏛️ ADR Link
[Related ADR if applicable]
