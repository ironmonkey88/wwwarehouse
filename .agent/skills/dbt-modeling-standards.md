# Skill: dbt Modeling Standards 🏗️

This skill governs the development of SQL transformation models using dbt and DuckDB.

## 🎯 Context Activation
Activate this skill when:
- Creating new models in `transformation/dbt/`.
- Refactoring existing SQL logic.
- Updating `schema.yml` or `docs/` blocks.

## 🛠 Operational Methodology

### 🏷 Naming Conventions
- **Files**: `snake_case`.
- **Staging**: Prefix with `stg_` (e.g., `stg_somerville__councilors.sql`).
- **Core (Silver)**: Prefix with `int_` (Intermediate) or simply the entity name.
- **Marts (Gold)**: Prefix with `dim_` (Dimensions) or `fct_` (Facts).

### 🏗 Model Structure
1. **CTE-First**: Use Common Table Expressions (CTEs) for readability.
2. **Final Select**: The final CTE should always be `select * from final`.
3. **No Logic in Gold**: Business logic should be isolated in Silver; Gold is for clean presentation.

### 🧪 Quality & Integrity
1. **Mandatory Tests**: Every model MUST have `unique` and `not_null` on its primary key.
2. **Docs Mandate**: Use `{{ doc('description_name') }}` for complex logic documentation.
3. **External Persistence**: For large models, configure `+post-hook: "copy {{ this }} to 'gs://warehouse-011793-factory/gold/{{ this.name }}.parquet' (FORMAT PARQUET)"` if not managed by dbt-duckdb defaults.

## 🧩 Dependencies
- `dbt-duckdb` adapter.
- `refinery` dbt project.
- `roborev` for SQL style audit.
