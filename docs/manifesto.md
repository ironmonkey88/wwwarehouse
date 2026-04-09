# WWWarehouse Manifesto: The "Wong Way" 📜

> **"Always do things the Wong Way."** — Gordon Wong, Principal Architect

## 1. Vision: The Data Factory
In the "Wong Way," we build automated **Assembly Lines** to produce high-value **Knowledge Products**.

### 🏗 The Right Principle (Core Mandate)
We deliver **the right data**, in **the right place**, at **the right time**, in **the right format**. 
- We must be able to **prove** that it’s right (Lineage & Testing).
- We must **know** that it’s right (Observability & Monitoring).

- **Reality:** We use **Serverless DuckDB + GCS** to avoid GCP VM and idle BigQuery costs.
- **Metric:** Our goal is a base cost of **$0/month** when active tasks are not running.

### 📈 Upgradability Principle (Scale-as-You-Grow)
We start **Serverless** as our "Zero-Idle" baseline, but we design every component for a seamless **"In-Place Upgrade"** as the assembly lines scale.
- **Transformation:** DuckDB (Serverless) -> MotherDuck (Dedicated) -> BigQuery.
- **Semantic Layer:** Cube on Cloud Run (Serverless) -> Cube Cloud / GKE.
- **Delivery:** Evidence.dev (Static Serverless) -> Lightdash (Dedicated VM).

## 2. Approach: Agentic & Self-Healing
We do not build manual ETL pipelines. We build **Agent Sovereignty**.
- **Kilo Code:** Our "Kilo" agents (VS Code integration) own the dbt transformations and refactoring loops.
- **Gastown:** Our executive dashboard for high-concurrency ingestion. If a scraper fails, it’s an agent's job to heal it before a human is paged.

## 3. Design Principle: The "Staging Hive"
To achieve high parallelism without the complexity of a persistent multi-user database, we use the **Staging Hive** pattern.
- Every source pipeline (311, GIS, Real Estate) writes to its own dedicated DuckDB file on GCS.
- Collsion-free by design.
- Merged by dbt in the Silver layer using `ATTACH` operations.

## 4. Decision Archiving (The "Why")
We do not make decisions in the dark. Every major shift is recorded for future audits.
- **ADRs (Architecture Decision Records):** Mandatory for any structural/tooling change.
- **Beads (bd):** Every atomic task carries its rationale.
- **Goal:** Future Gordon (or his Agents) must be able to trace exactly *why* we chose the "Wong Way" for a specific component.

## 4. The Hierarchy of Needs (The Wong Foundation)
All work is categorized as either building the **Data Factory** (Infra, Tooling) or a **Knowledge Product** (Dashboards).

1. **Foundation (Security):** Minimal but encrypted. IAM-based signatures.
2. **Prep Quality (Trust):** Data must be deduplicated and tests must pass at the Bronze layer.
3. **Stocking (Reliability):** Automated incremental batches.
4. **Knowledge Products (Usability):** Dashboards for the end users must be pre-rendered and fast.
5. **Insights (Value):** Deep scores like Equity and Predictive Service Requests.

---
*Created by the Wong Way Assistant | April 2026*
