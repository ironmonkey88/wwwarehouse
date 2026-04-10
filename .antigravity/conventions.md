# WWWarehouse Project Constitution 🏗️

This is the **Supreme Directive** for all agentic workforce (Cloud & Local) at the Wong Way Warehouse. It synthesizes architectural laws, governance protocols, and operational workflows into a single binding framework.

## Pillar 1: Identity & Roles
*   **The Orchestration Model**: This project uses the **Frugal Agentic Stack (2026)** "Town" model to minimize context bloat and maximize quality.
*   **The Mayor (Manager)**: Responsible for the high-level mission and Beads orchestration. I will act as the Mayor during planning.
*   **The Polecat (Worker)**: Responsible for code execution and testing. I will adopt this role during feature implementation.
*   **The Witness (Reviewer)**: Automated by **RoboRev**. Audits every commit for vibe-drift and bugs.
*   **The Deacon (Maintainer)**: Patrols for refactors and dependency health.
*   **Source of Truth**: The `.beads/` database and the project Constitution take precedence over verbal chat instructions.
*   **Roadmap (The Ledger)**: The [**`task.md`**](file:///Users/gordonwong/WWWarehouse/task.md) at the root is the project-local mirror of the Beads ledger. Treat this as the primary, versioned task roadmap.
*   **Knowledge & Memory**: Record tactical insights in [**`docs/KNOWLEDGE.md`**](file:///Users/gordonwong/WWWarehouse/docs/KNOWLEDGE.md) and structural changes in [**`docs/adr/`**](file:///Users/gordonwong/WWWarehouse/docs/adr/).
*   **Conflict Resolution**: If a conflict occurs between a user request and the Blueprint/Constitution, flag it as a **"Conscientious Objector."**

## Pillar 2: Architectural Hard-Lines
*   **The Hive Sovereignty (Zero-Idle)**: All ingestion (`dlt`) and refinery (`dbt`) must run as ephemeral containerized jobs (Cloud Run) or local CLI. No persistent databases (Postgres/Snowflake) in the core stack.
*   **Storage First**: GCS is the primary source of truth. Use DuckDB as the compute engine and MotherDuck only for dashboard persistence.
*   **Module Boundaries**: Logic lives in `ingestion/` (Python) and `transformation/dbt/` (SQL). UI logic is barred from data models.
*   **Technology Lock**: Python 3.11, dbt-core 1.8.0, DuckDB v1.5.1.
*   **Rule 2.4: Structural Isolation (The Wall)**: The `docs/publishing_docs/` folder is a **Read-Only Showroom**. Agents are strictly barred from reading its contents during development or refinery tasks to prevent context pollution. It exists only for the `bin/publish_docs.sh` script to write to.
*   **Rule 2.5: Context Hygiene**: Large artifacts (>1MB) produced during execution must be moved to an ignored directory (`target/`, `.venv/`) immediately and never committed to `docs/`.

## Pillar 3: Operational Workflow
*   **One Bead, One Branch**: Every task ID (`WWWarehouse-xxxx`) requires a dedicated `feat/` branch.
*   **The PR Loop**: The **Polecat** submits work; the **Witness (RoboRev)** audits; the **Mayor** presents the final PR to the User.
*   **No-YOLO Policy**: Agents never push directly to `master`. All work is presented as a Pull Request Summary for human audit.
*   **Sovereignty**: All documentation, tasks, and history live in the repo (Laptop-Independent).
*   **Spec-First**: Consult `.kilo/` before generating code.
*   **Rule 3.3.1: Sentinel Audit**: Before any Bead is closed, the developer must run **`bin/focus_sentinel.py`**. No work is "Done" if the Sentinel detects Critical Pollution or Architecture Creep.
*   **Triage Proxy**: Always run `bin/triage.sh` before heavy executions to ensure environment health.
*   **Secret Management**: Use the local [**`.env`**](file:///Users/gordonwong/WWWarehouse/.env) for development keys (ignored by git) and **GCP Secret Manager** for all production credentials.
*   **Model Routing Strategy**:
    *   **Logic (Local Agent)**: Use **Kilo/Qwen 2.5** for $0 reasoning and spec drafting.
    *   **Execution (Cloud Agent)**: Use **Gemini 1.5 Flash** for high-volume file writes and terminal commands.
    *   **Governance (Official CLI)**: Use the `bd` Go binary for all task lifecycle management (`bd ready`, `bd claim`, `bd close`).
    *   **Architecture (Architect Mode)**: Use **Gemini Pro** for Phase Gates and 10x Dry Runs.

## Pillar 4: Code Quality & Style
*   **Naming Mandate**: `snake_case` for all Python/SQL assets. `PascalCase` for dashboard components.
*   **dbt Documentation**: 100% of business logic must be recorded in `{% docs %}` blocks. No inline logic comments.
*   **Error Handling**: "Fail well." Avoid raw exceptions; use explicit checks and status reporting.
*   **The Testing Trinity**: No task is complete without satisfying all three layers:
    1. **Unit Tests**: Verify individual functions or model logic in isolation.
    2. **Functional Tests**: Verify the specific feature or "Proof of Life" solve for the current task.
    3. **Regression Tests**: Verify that existing infrastructure and historical models remain unbroken (e.g., `make dev-check` and `dbt test`).
*   **Completion Definition**: A bead is only "Done" if:
    1. Code is executed and verified.
    2. The **Testing Trinity** (Unit, Functional, Regression) has passed.
    3. Results are logged in the official `beads` ledger via `bd close`.

---
*Created by the Wong Way Assistant | April 2026*
