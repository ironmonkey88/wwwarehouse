# ADR-001: Triple-Seal Audit Mandate (Size, Shape, Sample)

**Date:** 2026-04-09
**Status:** Accepted

## Context

During the 311 Service Requests pipeline build, we discovered that verifying only record counts left a blind spot: a dropped record + a duplicated record would still show the same count. We needed a verification method that could prove the data was truly identical to the source.

## Decision

All ingestion pipelines must implement a **Stateless Auditor** (`bin/audit_<dataset>.py`) that enforces three mandatory gates:

1. **Size**: Total record count parity with the source.
2. **Shape**: Distribution counts by categorical key (e.g., `GROUP BY type`) must match exactly.
3. **Sample**: Random records are pulled from the source and compared field-by-field against the local vault.

This is called the **Wong Way Triple-Seal**.

## Consequences

- Every new dataset requires its own auditor script.
- Auditors must be stateless (no local cache of expected values) to prevent drift.
- The audit is the final gate before a pipeline is considered "Done."

---

# ADR-002: Eastern Time Naive (NZ) as Temporal Standard

**Date:** 2026-04-09
**Status:** Accepted

## Context

The Socrata API returns timestamps in UTC. DuckDB on macOS was storing them with Eastern offsets (-04:00). Comparing naive vs. offset-aware timestamps caused false "Timezone Ghost" failures in the Triple-Seal audit, even when the physical moments were identical.

## Decision

- **All timestamps** are converted to **US/Eastern** at the Silver layer.
- After conversion, the timezone label is **stripped** (cast to naive `TIMESTAMP`), producing a "No Timezone" (NZ) value.
- **Dates** (YYYY-MM-DD only) remain as `DATE` types. No upcasting to `TIMESTAMP`.

## Consequences

- Downstream users see "Local Truth" without needing to know about UTC offsets.
- No implicit re-conversion is possible because the timezone label is gone.
- All future datasets entering the refinery must follow this standard.

---

# ADR-003: 1% Moral Certainty Sampling Standard

**Date:** 2026-04-09
**Status:** Accepted

## Context

The original Sample gate checked only 10 records and only compared IDs and dates. For a 9,309-record dataset, 10 records is 0.1% — statistically weak. We also needed to verify every field in the row, not just the timestamp.

## Decision

- Sample size is **1% of total records** (dynamically calculated).
- All fields in the sampled row are compared (full-row identity check).
- Samples are pulled in a single batch API call (limit=200) and downsampled locally to minimize Socrata overhead.
- Total API calls for a full audit: **3** (Size, Shape, Sample batch).

## Consequences

- For a 9,309-record dataset, ~93 records are verified across all 24 fields.
- Statistically, this provides "moral certainty" — the probability of a systematic error surviving this check is negligible.
- As datasets grow, the sample count scales automatically.

---

# ADR-004: Evidence.dev over Lightdash for Analytics Layer

**Date:** 2026-04-09
**Status:** Accepted

## Context

The existing Terraform plan provisioned Lightdash on Cloud Run + Cloud SQL (Postgres). Review revealed:

- **Cloud SQL `db-f1-micro`** runs 24/7 at ~$8-15/mo — **violates Zero-Idle**.
- **Lightdash cold starts** on Cloud Run are ~30-60 seconds. The fix (`--min-instances 1`) eliminates cost savings.
- Lightdash requires a **cloud warehouse** (BigQuery/Postgres) — it cannot query local DuckDB files.
- Lightdash Cloud starts at **$800/mo**.

## Options Considered

| Option | Monthly Cost | Zero-Idle | DuckDB Native |
|--------|-------------|-----------|---------------|
| Lightdash Self-Hosted (Cloud Run + Cloud SQL) | ~$15-25 | No | No |
| Lightdash Cloud | $800+ | N/A | No |
| **Evidence.dev (Static Site BI)** | **$0** | **Yes** | **Yes** |

## Decision

Use **Evidence.dev** — a static site BI framework that:
- Queries DuckDB at build time and pre-renders HTML dashboards.
- Deploys as static files to Firebase Hosting (already configured at `civicpulse.thewongway.co`).
- Reports are Markdown files in Git — fully auditable and version-controlled.
- Uses DuckDB WASM for in-browser interactivity.

## Consequences

- No drag-and-drop chart builder — reports are code-first (SQL + Markdown).
- No multi-user saved views or scheduled email alerts.
- The `lightdash.tf` and `postgresql.tf` Terraform files should be removed.
- For a single-analyst civic data project, the trade-off is strongly favorable.

---

# ADR-005: Cube.dev Deferred to Phase 2 (Semantic Layer)

**Date:** 2026-04-09
**Status:** Accepted

## Context

A semantic layer (Cube.dev) was considered to ensure consistent metric definitions across reports. Cube Core is free and open-source, has native DuckDB support, and exposes a Postgres-compatible SQL API that Evidence.dev can consume.

However, Cube is a persistent server process (API + Refresh Worker + Cube Store). Running it locally is free but laptop-dependent. Running it in the cloud reintroduces persistent infrastructure costs.

## Decision

**Defer Cube.dev to Phase 2.** With only 2 dbt models (`stg_311_requests`, `stg_councilors`) and a single analyst, a semantic layer adds complexity without proportional value.

**Trigger for Phase 2:** When metric definitions start duplicating across reports, or when 5+ datasets are in the refinery.

## Consequences

- Phase 1: Evidence.dev queries DuckDB directly. dbt `schema.yml` acts as a lightweight semantic contract.
- Phase 2: Introduce Cube Core locally. Evidence reads Cube, Cube reads DuckDB.
- Phase 3 (if needed): Move Cube to Cloud Run for live external queries.
