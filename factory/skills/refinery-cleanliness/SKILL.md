# Skill: Refinery Cleanliness (Medallion Standards) 🧪

## Objective
Enforce the "Wong Way" Medallion standards to ensure high-velocity, high-integrity data transformations.

## Tactical Instructions

### 1. Naming Conventions (The Brand)
- **Bronze (stg_*)**: Direct 1:1 mapping from source to dbt models with minimal casting. 
- **Silver (int_*)**: Intermediate models where joins and complex logic occur.
- **Gold (fct_*, dim_*)**: Business-ready models. Must be performant and fully documented.

### 2. Logic Isolation
- Never perform a join in a `stg_` model.
- Every `int_` and `fct_` model MUST have a unique primary key defined in the `schema.yml`.
- Logic involving PII (Personal Identifiable Information) must be isolated into a `stg_` model and hashed/masked immediately before reaching Silver.

### 3. Performance & Frugality
- Avoid `SELECT *`. Explicitly name all columns to ensure dbt's column-level lineage works correctly.
- Use `dbt-utils` for common surrogates and hash keys.

## Validation Trinity
1. **Lineage**: Does the model follow the stg -> int -> fct flow?
2. **Integrity**: Are `unique` and `not_null` tests presence in `schema.yml` for all keys?
3. **Sovereignty**: Does the model rely only on other dbt models (no raw SQL table references)?
