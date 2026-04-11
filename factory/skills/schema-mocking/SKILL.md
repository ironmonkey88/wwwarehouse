# Skill: Schema Mocking (High-Fidelity Mocks) 🧪

## Objective
Generate sophisticated mock data for pipeline stress-testing and architecture drills.

## Tactical Instructions

### 1. Structure Replication
- Analyze the target schema (e.g., Somerville 311) and replicate its columns exactly in the mock.

### 2. Reality Injection
- Use 'Faker' or 'numpy' to generate varied, non-linear data (e.g., date ranges, category distributions).
- Ensure the mock data triggers specific 'Transformation Gates' (e.g., null values, invalid wards).
EOF && \
cat << 'EOF' > factory/skills/bead-governance/SKILL.md
# Skill: Bead Governance (Precision Tracking) 📿

## Objective
Enforce the strict open/close lifecycle of task 'Beads' to ensure project momentum.

## Tactical Instructions

### 1. Bead Creation
- Every new feature must be assigned a unique Bead ID.
- Tag all commits with the Bead ID.

### 2. The Closure Seal
- A Bead can only be closed if:
  - The Witness provides a Triple-Seal Audit.
  - The Sifu logs the learning for the session.
