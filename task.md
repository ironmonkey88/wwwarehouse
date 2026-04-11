# Task: Sovereign Data Profiling 📊

Implementing automated data quality scanning for 1.16M records in the cloud lakehouse.

## Progress
- [x] **CP-P01: Configure Persistence**
    - [x] Update `profile_stg_311_requests.sql` to `materialized='external'`.
    - [x] Set GCS path: `s3://warehouse-011793-factory/gold/profiling/`.
- [x] **CP-P02: Orchestrate CI/CD**
    - [x] Update `cloudbuild.yaml` with `dbt run --select profiling`.
    - [x] Remove exclusion from doc-gen step.
- [x] **CP-P03: Build Visualization**
    - [x] Create `analytics/evidence/sources/civic_pulse/profiling_stats.sql`.
    - [x] Create `analytics/evidence/pages/profiling.md`.
- [x] **CP-P04: Deploy & Verify**
    - [x] Fix `INFORMATION_SCHEMA` catalog error for DuckDB profiling
    - [x] Stabilize Docker base image (`slim-bookworm`)
    - [x] Resolve "Bad file descriptor" error (Switched to file-based DuckDB)
    - [x] Verify successful profiling in Build `2c7bf5c5-6cef-468d-8b1b-c09786b43c30`
    - [ ] Resolve Evidence portal build error (Step #4)
