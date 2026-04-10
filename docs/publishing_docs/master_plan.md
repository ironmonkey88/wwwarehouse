# WWWarehouse: The Ultimate Master Plan 🏛️

This is the consolidated **Single Source of Truth** for the **Wong Way Data Factory**. It combines the architectural vision, the "Zero-Idle" stack, and the full, granular task execution ledger into one traceable document.

---

## 💡 1. The Vision: Zero-Idle Sovereignty
The goal is to build an "On-Demand Data Lakehouse" with **$0 base cost**. The factory is 100% executable in the cloud, independent of any local hardware, but managed by a local "Agentic Brain."

### Core Principles
1.  **Vibe Chaining**: Pattern reuse from Somerville CivicPulse.
2.  **Occam’s DWH**: Minimalist tech stack (DuckDB/SQL).
3.  **Knowledge Products**: Metric-first delivery.
4.  **The "Steel Thread"**: E2E 311 pipeline as the first production line.
5.  **Laptop Independence**: Production stays "On" when the laptop is "Off."

---

## 🛠️ 2. The Technical Stack (ZIST)
| Layer | Technology | Rationale |
| :--- | :--- | :--- |
| **Ingestion** | `dlt` (Python) | Serverless, python-native, and agent-friendly. |
| **Refinery** | `dbt-duckdb` | High-speed OLAP compute with $0 infrastructure cost. |
| **Storage** | **GCS (Google Cloud Storage)** | Standardized, inexpensive Parquet lakehouse. |
| **Semantic** | **Cube.dev** | Postgres-compatible metric gateway for BYOBI support. |
| **Persistence** | **MotherDuck** | Hybrid cloud-local persistence for high concurrency. |
| **Governance** | **Beads (Dolt/GCS Sync)** | Git-for-data task tracking with cloud sovereignty. |

---

## 🏗️ 3. Phased Milestones

### Phase 0: Agentic Setup (The Brain & Body)
*In this phase, we establish the factory's operational logic and governance. We setup the local AI 'Brain' (Kilo/Ollama) and the 'Body' (Beads task manager). By the end of this phase, the factory will have a persistent, cloud-synced memory and will be ready to execute technical tasks autonomously.*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test:** `bd list` returns the Phase 0-5 roadmap in the terminal.
- [ ] **Functional Test:** `ollama list` confirms local model availability (e.g., Llama3).
- [ ] **Functional Test:** `dlt --version` and `dbt --version` run successfully inside the `.venv`.
- [ ] **Functional Test (Delegation):** Run `ollama run <model> "Project Heartbeat"` to verify local inference is reachable from the factory floor.

### Phase 1: Foundation (The Factory Floor)
*Here we build the physical and digital infrastructure. We provision the 'Hive' (GCS storage) and the 'Monitoring Station' (Secret Manager/Slack). This phase transforms an empty project into a structured environment capable of securely hosting data and running tasks.*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test:** `gsutil ls gs://warehouse/` confirms `bronze/`, `silver/`, and `gold/` paths exist.
- [ ] **Functional Test:** `gcloud secrets versions access 1 --secret="SLACK_WEBHOOK_URL"` returns a valid URL.
- [ ] **Functional Test:** `duckdb -c "DESCRIBE admin.load_history"` works against the GCS-hosted state file.

### Phase 2: The Steel Thread (First Product)
*This is our most critical milestone. We build a single, complete 'Assembly Line' from the NYC/Somerville 311 API all the way to a live Dashboard. This proves our 'Zero-Idle' stack works end-to-end and delivers the factory's first certified Knowledge Product (Rat Complaint Hotspots).*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test:** `dlt pipeline 311_service_requests load` completes with 0 errors.
- [ ] **Functional Test:** `dbt build` passes all schema and data quality tests for the 311 model.
- [ ] **Functional Test:** Evidence.dev renders the 'Rat Hotspots' chart using the Gold Parquet layer.

### Phase 3: Agentic Sovereignty (Self-Healing)
*In this phase, we install the factory's 'Immune System.' We implement automated repair loops that allow the agent to detect schema changes or scraper failures and fix the code autonomously. This ensures the factory remains reliable without human intervention.*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test (Chaos):** Manually renaming a source column triggers a `dlt` failure, followed by a successful Kilo-Heal auto-repair.
- [ ] **Functional Test:** A `#wwwarehouse-alerts` Slack message is received confirming "Job Successful."

### Phase 4: Scaling (Production Persistence)
*We now scale the factory for consumption. We bridge our local DuckDB files to MotherDuck and Cube.js to provide a persistent, high-concurrency 'Front Door' for BI tools. This allows multiple users to query the warehouse simultaneously with sub-second performance.*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test:** `motherduck -c "SELECT count(*) FROM gold.rat_hotspots"` matches GCS row counts.
- [ ] **Functional Test:** Cube.js Playground returns the 'Hotspot Metric' via its SQL API endpoint.

### Phase 5: The Meta-Factory (Data on Data)
*Finally, we build the factory's control room. we implement the 'Odometer' telemetry dashboard, E2E lineage mapping, and automated data profiling. This phase provides the 'Proof of Trust' needed to certify the accuracy and freshness of every metric we produce.*

**Validation Gate (Definition of Done):**
- [ ] **Functional Test:** Evidence.dev footer renders a Mermaid graph tracing from SODA API → Gold Table.
- [ ] **Functional Test:** `dbt docs generate` produces a catalog containing transformation rules for all Gold metrics.
- [ ] **Functional Test:** Odometer Dashboard shows 100% of sources are within their SLA window.

---

## 🧭 4. Detailed Construction Task List (Beads)

### 🤖 Phase 0: Agentic Setup
- [ ] **CP-001: Install Beads (bd)**
    - **Methodology**: Link the `bd` script/binary from `Documents/SomervilleCivicPulse/bd` to the local `bin/` or global path. Initialize a Dolt repo in `beads/` and **bootstrap this roadmap into the ledger**. Add a GCS remote for cloud-sovereign synchronization.
    - **Technology**: Shell, Python, Dolt (gs:// remote).
    - **Outcome**: `bd` command working with a live, cloud-synced task ledger.
- [ ] **CP-002: Antigravity/Kilo Integration**
    - **Methodology**: Create `.kilorules` and `.agent/config.json` defining project standards (dbt first, zero-idle).
    - **Technology**: JSON, Markdown.
    - **Outcome**: `.kilorules` established.
- [ ] **CP-003: Local Model Audit**
    - **Methodology**: Run `ollama list` and `ollama run <model>` to verify local inference.
    - **Technology**: Ollama, Llama3/Mistral.
    - **Outcome**: Verified local LLM availability.

### 🛠 Phase 0.1: Factory Toolbox Provisioning
- [ ] **CP-000: Initialize Python .venv**
    - **Methodology**: Run `python3 -m venv .venv` in the project root to isolate Data Factory dependencies.
    - **Technology**: Python 3.11+, venv.
    - **Outcome**: `.venv/` directory created.
- [ ] **CP-004: Install dlt & dbt Stack**
    - **Methodology**: Run `pip install dlt[duckdb]==0.5.10 dbt-core==1.9.0 dbt-duckdb==1.9.0` to enable the refinery.
    - **Technology**: Python, pip.
    - **Outcome**: `dlt` and `dbt` commands available in .venv.
- [ ] **CP-005: Install Terraform**
    - **Methodology**: Run `brew install terraform@1.10` for GCP infrastructure management.
    - **Technology**: Homebrew, Terraform.
    - **Outcome**: `terraform` command available.
- [ ] **CP-006: Install DuckDB CLI**
    - **Methodology**: Run `brew install duckdb==1.5.1` for local data exploration (aligned with MotherDuck lifecycle).
    - **Technology**: Homebrew, DuckDB.
    - **Outcome**: `duckdb` command available.
- [ ] **CP-007: Factory Access Audit (gcloud/npm)**
    - **Methodology**: Fix `PATH` to include `/usr/local/bin` and verify `gcloud` and `npm` are callable for Secret Manager and Evidence.dev setup.
    - **Technology**: Shell.
- [ ] **CP-008: Install Dolt CLI**
    - **Methodology**: Run `brew install dolt` to enable the Beads governance ledger.
    - **Technology**: Homebrew, Dolt.
    - **Outcome**: `dolt` command available.

---

## 📦 5. Dependency & Version Manifest
To ensure "Zero-Idle" stability and MotherDuck compatibility, the factory is locked to the following version matrix:

| Component | Target Version | Rationale |
| :--- | :--- | :--- |
| **Python** | `3.11.x` | Performance and modern typing support. |
| **dbt-core** | `1.9.0+` | Support for the **microbatch** incremental strategy. |
| **dbt-duckdb** | `1.9.x` | Alignment with dbt-core 1.9 decoupled adapter architecture. |
| **DuckDB** | `1.5.1` | Required for persistent MotherDuck hybrid-cloud execution. |
| **dlt** | `0.5.x` | Latest stable for incremental SODA ingestion. |
| **Terraform** | `1.10.x` | Standard for modern GCP provider support. |
| **Node.js** | `v22.x` | Latest LTS for Evidence.dev and Cube.js. |

### 🏗 Phase 1: Factory Infrastructure (Foundation)
- [ ] **CP-101: GCS Warehouse Setup**
    - **Methodology**: Deploy Terraform to create `gs://warehouse/` with explicit prefixes. **Crucially**, provision a `factory-runner` Service Account mathematically bound to Cloud Run with `Secret Manager Secret Accessor` role.
    - **Technology**: Terraform, GCP GCS, GCP IAM.
- [ ] **CP-102: Slack Monitoring Station**
    - **Methodology**: Provisions a Slack Webhook in GCP Secret Manager and creates a `notify_slack.py` utility.
    - **Technology**: Python, GCP Secret Manager.
- [ ] **CP-103: The Odometer Registry (Telemetry)**
    - **Methodology**: Initialize the `admin` schema in **MotherDuck** rather than raw GCS DuckDB, to natively handle multi-client concurrent logs from ingestion and dbt.
    - **Technology**: MotherDuck.

### 🐀 Phase 2: The Steel Thread (311 Assembly Line)
- [ ] **CP-201: Rat Complaint Ingestion (dlt)**
    - **Methodology**: Use `dlt` with the `filesystem` destination to pull incremental Rat Complaint records and write Parquet directly to GCS. Explicitly configure GCS as the pipeline state backend to prevent load amnesia.
    - **Technology**: dlt, Python, GCS.
- [ ] **CP-202: The Refinery (dbt)**
    - **Methodology**: Build Medallion models (Bronze -> Silver -> Gold) using `dbt-duckdb` directly against the GCS Parquet files.
    - **Technology**: dbt-core, DuckDB, Parquet.
- [ ] **CP-203: The Knowledge Product (Evidence)**
    - **Methodology**: Create an Evidence.dev site leveraging live SQL queries against DuckDB to offload heavy agg logic, avoiding out-of-memory static compilation.
    - **Technology**: Evidence.dev, SQL.

### 🤖 Phase 3: Agentic Sovereignty (Kilo-Heal)
- [ ] **CP-301: The Self-Healing Scraper**
    - **Methodology**: Script a "Chaos Test" where a source schema changes; Kilo must auto-update the pipeline.
    - **Technology**: Python, Kilo Code, TDD.
- [ ] **CP-302: Odometer Alerting**
    - **Methodology**: Create a Cloud Run Job to emit a daily Slack digest of factory performance.
    - **Technology**: GCP Cloud Run, Python, Slack.

### 📈 Phase 4: Scaling (GCP Persistence)
- [ ] **CP-401: Cube Universal Gateway**
    - **Methodology**: Deploy Cube.js as a Cloud Run service to provide a Postgres-compatible SQL API. Configure a Cloud Scheduler "ping" to maintain 1 warm instance, avoiding 30s BI timeouts.
    - **Technology**: Cube.dev, Docker, Cloud Run, Cloud Scheduler.
- [ ] **CP-402: MotherDuck Persistence**
    - **Methodology**: Integrate MotherDuck as a persistent caching layer for high-concurrency dashboards.
    - **Technology**: MotherDuck, dbt-duckdb.

### 📈 Phase 5: The Meta-Factory (Data on Data)
- [ ] **CP-501: Telemetry Schema Design**
    - **Methodology**: Design SQL views for Data Freshness, Record Volume, and Error Rates.
    - **Technology**: SQL, DuckDB.
- [ ] **CP-502: Pipeline Instrumentation**
    - **Methodology**: Add `post-load` hooks to dlt and use `on-run-end` project-level hooks in dbt to aggregate results into a single Slack/DB payload to avoid rate-limiting API 429s.
    - **Technology**: Python, dbt hooks.
- [ ] **CP-503: The Warehouse Odometer Dashboard**
    - **Methodology**: Build a "Gastown" status dashboard visualizing the health of all systems.
    - **Technology**: Evidence.dev, SQL.
- [ ] **CP-504: dbt-Native Lineage Explorer**
    - **Methodology**: Map ingestion sources to `dbt sources.yml`. Use `manifest.json` for the Evidence footer.
    - **Technology**: dbt-core, Mermaid.js.
- [ ] **CP-505: dbt Doc Blocks (The Logic Book)**
    - **Methodology**: Create a dedicated `docs/` directory. Use dbt `.md` files to record rules and "Why" logic.
    - **Technology**: dbt-core doc blocks.
- [ ] **CP-506: Automated Data Profiling**
    - **Methodology**: Write pure native duckdb `test` macros to define "Normal" bounds for Row Counts, avoiding bulky cross-db dependency traps.
    - **Technology**: dbt, SQL.
- [ ] **CP-507: ERD Maintenance (The Topology Seal)**
    - **Methodology**: Update the project ERD in `docs/ERD.md` for every new Silver/Gold model.
    - **Technology**: Mermaid.js, Markdown.
- [ ] **CP-508: Public Portal Synchronization**
    - **Methodology**: Ensure `bin/publish_docs.sh` is triggered after every production release.
    - **Technology**: Shell, gsutil.
- [ ] **CP-509: Lightdash Semantic Audit**
    - **Methodology**: Periodic scan of `schema.yml` to ensure `tags: ["lightdash"]` coverage for all Gold assets.
    - **Technology**: Python, dbt-core.

---
*Created by the Wong Way Assistant | April 2026*
