# Skill: Medallion Logic Audit 🏗️

## Objective
Enforce the integrity of the Bronze/Silver/Gold transformation layers to prevent logical bleed and ensure high-performance consumption.

## Tactical Instructions

### 1. The Silver Gate (Integration)
- Silver models MUST NOT contain "Business Logic" that changes the meaning of raw data (e.g., categorizing 311 types into "Urgent" vs "Standard").
- Silver's sole duty is **Cleanup** (casting, renaming, deduping) and **Joining** (denormalization of sources).
- Reject any Silver model that aggregates data beyond the primary key grain.

### 2. The Gold Gate (Consumption)
- Gold models MUST prioritize the **Lookout's** performance requirements.
- Aggregations and complex business logic (Case statements for KPIs) live ONLY in Gold.
- Gold tables should be optimized for DuckDB read-performance (e.g., pre-sorted on common filtering timestamps).

### 3. The Steel Thread Trace
- Every model design must explicitly identify its "Source Bead" (where the raw data entered the factory). No "Orphan Logic" is permitted.

## Validation Trinity
1. **Size**: Does the model lineage have <3 hops from Source to Gold?
2. **Shape**: Are column names standardized (snake_case) and cast correctly?
3. **Sample**: Can the logic be explained in 1 sentence to a non-technical Mayor?
