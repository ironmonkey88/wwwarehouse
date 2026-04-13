# The Sovereign Manifesto 🏮

> **"Always do things the Wong Way."** — Gordon Wong, Principal Architect

## 1. Vision: The Data Factory
In the "Wong Way," we build automated **Assembly Lines** to produce high-value **Knowledge Products**. 

We deliver **the right data**, in **the right place**, at **the right time**, in **the right format**. 

### 🏗 The Right Principle (Core Mandate)
- **Proof:** We must be able to prove that it’s right (Lineage & Testing).
- **Knowledge:** We must know that it’s right (Observability & Monitoring).
- **Zero-Idle:** We use Serverless **DuckDB + GCS** to avoid idle infrastructure costs. Our target base cost is **$0/month** when idle.

### 📈 Upgradability Principle (Scale-as-You-Grow)
We start Serverless but design for seamless "In-Place Upgrades":
- **Transformation:** DuckDB -> MotherDuck -> BigQuery.
- **Semantic Layer:** Cube (Serverless) -> Cube Cloud.
- **Delivery:** Evidence.dev (Static Result) -> Lightdash (Dedicated).

## 2. Approach: Agentic & Self-Healing
We build **Agent Sovereignty**. 
- **The Workforce:** Independent agents own the dbt transformations and refactoring loops.
- **Self-Healing:** If a pipeline fails, it is an agent's job to heal it before human intervention is required.

## 3. Design: The "Staging Hive"
To achieve high parallelism without a persistent multi-user DB, we use the **Staging Hive** pattern. 
- Every source pipeline writes to its own dedicated DuckDB file on GCS.
- Collision-free by design.
- Merged by dbt in the Silver layer using `ATTACH` operations.

---
*Factory Constitution | April 2026*
