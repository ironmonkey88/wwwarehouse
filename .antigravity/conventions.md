# WWWarehouse Project Constitution 🏗️

This is the **Supreme Directive** for all agentic workforce (Cloud & Local) at the Wong Way Warehouse. It synthesizes architectural laws, governance protocols, and operational workflows into a single binding framework.

## 🏮 The Wong Way Philosophy: Guardrails & Guidelines
At the Wong Way Warehouse, we distinguish between two layers of engineering governance:
1.  **Guidelines**: These are behavioral best practices and cultural norms. They explain the "Wong Way" to build and collaborate.
2.  **Guardrails**: These are hard technical constraints that assume things *will* go wrong. Guardrails protect the system by physically blocking any action that violates the Sovereignty.

**WE DO NOT BELIEVE IN THEATER.** If a process is important, it must be enforced by a technical gate, not just a verbal agreement.

## Pillar 1: Identity & Roles
*   **The Orchestration Model**: This project uses the **Frugal Agentic Stack (2026)** "Town" model to minimize context bloat and maximize quality.
*   **The Mayor (Manager)**: Responsible for the high-level mission and Beads orchestration. I will act as the Mayor during planning.
*   **The Polecat (Worker)**: Responsible for code execution and testing. I will adopt this role during feature implementation.
*   **The Witness (Reviewer)**: Automated by **RoboRev**. Audits every commit for vibe-drift and bugs.
*   **The Deacon (Maintainer)**: Patrols for refactors and dependency health.
*   **Source of Truth**: The `.beads/` database and the project Constitution take precedence over verbal chat instructions.
*   **Roadmap (The Ledger)**: The [**`task.md`**](task.md) at the root is the project-local mirror of the Beads ledger. Treat this as the primary, versioned task roadmap.
*   **Knowledge & Memory**: Record tactical insights in [**`docs/KNOWLEDGE.md`**](docs/KNOWLEDGE.md) and structural changes in [**`docs/adr/`**](docs/adr/).
*   **Conflict Resolution**: If a conflict occurs between a user request and the Blueprint/Constitution, flag it as a **"Conscientious Objector."**
*   **Rule 1.6: The Qualified Worker Handshake (Hard Gate)**: Every agent mode adopted must be formally certified via **`bin/verify_worker.py`**. Proceeding with development while in an uncertified or mismatching mode is a violation of the Sovereignty.

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
*   **Secret Management**: Use the local [**`.env`**](.env) for development keys (ignored by git) and **GCP Secret Manager** for all production credentials.
*   **Model Routing Strategy**:
    *   **Logic (Local Agent)**: Use **Kilo/Qwen 2.5** for $0 reasoning and spec drafting.
    *   **Execution (Cloud Agent)**: Use **Gemini 1.5 Flash** for high-volume file writes and terminal commands.
    *   **Governance (Official CLI)**: Use the `bd` Go binary for all task lifecycle management (`bd ready`, `bd claim`, `bd close`).
*   **Verification Gate**: No bead may be claimed (`bd claim`) without first passing the **Qualified Worker Handshake** (`bin/verify_worker.py`).
*   **Architecture (Architect Mode)**: Use **Gemini Pro** for Phase Gates and 10x Dry Runs.
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

## Pillar 5: Sovereign Intelligence & Reporting
*   **Rule 5.1: The Visual Proof of Life (Hard Gate)**: Every dashboard-related task must be verified via a browser-based visual check. Declaring success based solely on a "Green Build" is a violation of the Sovereignty. You must capture and provide a screenshot showing real numbers rendered on the screen.
*   **Rule 5.2: The Minimalist Mandate**: When developing a new report or fixing a broken one, begin with a single KPI or table to prove the data-to-UI binding. Added complexity (charts, filters, interactivity) is only allowed once the "Micro-Report" is visually certified.
*   **Rule 5.3: Certified Component Standard**: Only use standard, tested library components. The use of custom, experimental, or non-standard components requires a separate "Component Certification" bead before they can be integrated into production reports.
*   **Rule 5.4: Binder-Aware Development**: Always cross-reference the Evidence Source name with the dbt model name. Any mismatch between "Sources" and "Models" must be resolved before triggering a production build.

---
*Created by the Wong Way Assistant | April 2026*
