# Skill: Data Quality & Definition of Done (DoD) 📜

This skill governs the final verification gate for all data assets (tables and models) in the project.

## 🎯 Context Activation
Activate this skill when:
- Designing a new ingestion pipeline.
- Developing a dbt transformation model.
- Performing a final audit before closing a Bead.

## 🛠 Operational Methodology

### 🥉 Bronze Layer (Ingestion)
1. **Persistence**: Verify data is in GCS (`bronze/`) and registered in DuckDB.
2. **Lineage**: Ensure `_dlt_load_id` and `_dlt_id` are present.
3. **Types**: Verify dates are cast to `DATE` or `TIMESTAMP`.

### 🥈 Silver/Gold Layers (Transformation)
1. **The Testing Trinity**:
    - `unique` and `not_null` pass for all primary keys.
    - Business logic unit tests pass via `dbt test`.
2. **Observability**: 100% column descriptions in `schema.yml`.
3. **Frugal Design**: Verify only essential columns are materialized to GCS.
4. **Lineage**: Verify the DAG in `dbt docs` is unbroken from Source to Gold.

### ✅ Final Gate (Bead Closure)
- Feature branch merged to `master`.
- **Witness (RoboRev)** has signed off on the commit.
- Odometer spend has been recorded.

## 🧩 Dependencies
- `dbt` and `dlt` for verification.
- `bd` for task closure.
- `roborev` for auditor feedback.
