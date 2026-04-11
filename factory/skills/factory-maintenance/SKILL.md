# Skill: Factory Maintenance (DataOps Tooling) 🛠️

## Objective
Build and maintain the internal utilities, observability scripts, and infrstructure automation for the Data Factory.

## Tactical Instructions

### 1. Utility Engineering
- Write Python/Shell scripts for:
  - **Token Tracking**: Parsing logs to estimate LLM costs.
  - **Performance Profiling**: Analyzing DuckDB query execution times.
  - **Database Cleanup**: Managing WAL files and temporary Parquet exports.

### 2. Monitoring Scripts
- Build `dlt` pipelines for the factory's own telemetry (e.g., loading `logs/` into a `bronze_telemetry` table).
- Automate the generation of "Freshness Proofs" for the Witness to audit.

### 3. Absolute Portability
- Ensure all maintenance scripts follow 'Binary Sovereignty' rules (Shebangs, Env-isolation).
