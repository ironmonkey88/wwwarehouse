# Skill: Cube Logic (Semantic Modeling) 🧊

## Objective
Master the creation and orchestration of Cube.js schemas for high-performance, governed analytics.

## Tactical Instructions

### 1. Cube Definitions
- Use `cube` files with `measures` and `dimensions`.
- Define `sql` blocks that refer to our Gold layer models only.
- Prefer `type: count` or `type: sum` for simple measures.

### 2. Pre-Aggregations
- Identify "Heavy" dashboards (>1M rows) and define `preAggregations`.
- Use `refreshKey` based on the warehouse's `processed_at` timestamp.

### 3. Security & Context
- Implement "Security Context" for user-specific filtering if multiple wards or regions are added.
- Use `CUBEJS_DB_TYPE=duckdb` for the local development bridge.
EOF && \
cat << 'EOF' > factory/skills/visual-verification/SKILL.md
# Skill: Visual Verification (The Eye-Test) 👁️

## Objective
Ensure 100% mathematical integrity of all visualizations via manual SQL audits.

## Tactical Instructions

### 1. Cross-Check Protocol
- For every chart total, write a corresponding raw SQL query in the warehouse.
- If the numbers differ by >0%, investigate the "Semantic Drifts" in Cube or dbt metrics.

### 2. Mock Logic
- During development, use `WHERE` clauses to sample tiny datasets (1,000 rows) to verify join logic.
- Log these "Verification Proofs" in the session walkthrough.

### 3. The Proof Section (SOP-004)
- Automated verification: Query `dbt_test_results` and display "Tests Passed" status directly on the dashboard.
EOF && \
cat << 'EOF' > factory/skills/evidence-plating/SKILL.md
# Skill: Evidence Plating (Dashboard Engineering) 🍽️

## Objective
Build high-fidelity, interactive dashboards using Evidence.dev (SQL + MDX).

## Tactical Instructions

### 1. MDX Layout
- Use `Value` components for Hero metrics.
- Use `DataTable` with `search=true` and `download=true` for transparency.
- Mandatory: Every dashboard MUST include a `<ProofSection />` component at the bottom.

### 2. Data Sourcing
- Use `{#query ...}` blocks to fetch data from DuckDB or the Semantic Layer.
- Prefer calling the Semantic Layer (`dbt sl query`) to avoid logic duplication.

### 3. Performance
- Use Evidence's static site generation (SSG) for fast initial loads.
- Minimize row counts using `LIMIT` or aggregations in the SQL block.
EOF && \
cat << 'EOF' > factory/skills/aesthetic-mastery/SKILL.md
# Skill: Aesthetic Mastery (The Wow Factor) 🎨

## Objective
Deliver premium, editorial-quality visualizations that exceed generic defaults.

## Tactical Instructions

### 1. Color Theory
- Use curated HSL palettes (e.g., `hsl(210, 50%, 60%)`) for harmonious branding.
- Avoid browser defaults (solid red, blue).

### 2. Typography & Form
- Use modern sans-serif fonts (Outfit, Inter).
- Ensure consistent spacing (`rem` based) and shadow layers for depth.

### 3. Interactive Polish
- Add subtle hover effects (`transform: scale(1.05)`) to chart cards.
- Ensure all charts are mobile-responsive using flexbox/grid.
