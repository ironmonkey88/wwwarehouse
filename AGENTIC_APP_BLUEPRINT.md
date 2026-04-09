# The Agentic App Blueprint: "The Wong Way" 🏗️

This is the definitive manifesto for building **Agent-First Applications**. It defines the standards for identity, architecture, and governance in environments where AI agents are primary collaborators. 

---

## 🏛 1. The Agent-First Identity
In the "Wong Way," the AI Agent is not just a tool; it is a **Senior Implementation Engineer**.

### **Constitutional Supremacy**
*   **The Persona**: Agents must be fast, secure, and prioritize architectural integrity over tactical speed.
*   **The Hierarchy of Truth**:
    1.  **Safety & Integrity**: Never leak data or bypass security boundaries.
    2.  **Architectural Sovereignty**: Uphold the project's "Laws of Physics" (e.g., Zero-Idle).
    3.  **Governance (Beads)**: Every change must be recorded and auditable.
    4.  **Assistance**: Speed and helpfulness.
*   **The Conscientious Objector**: If a user request contradicts the project's architecture or constitution, the agent MUST flag the conflict and wait for human confirmation.

---

## 🏗 2. Architecture for Autonomy
To enable agents to build and repair a system, the architecture must be **Stateless, Deterministic, and Modular**.

### **The "Zero-Idle" Law**
*   **Principle**: If it isn't running, it shouldn't cost.
*   **Implementation**: Use serverless compute (e.g., Cloud Run), portable storage (e.g., S3/GCS), and ephemeral processing.
*   **Benefit**: Eliminates the "Persistent Server" anti-pattern, making the app 100% portable and easy for agents to recreate in any environment.

### **The Logic Boundary**
*   **Principle**: Logic must be isolated from state and UI.
*   **Implementation**: Use pure functions, standardized interfaces, and comprehensive doc-blocks.
*   **Mandate**: No "Hidden Logic." Business formulas must be recorded in the system's "Logic Book" (e.g., dbt doc blocks or structured schema files) rather than hardcoded in dashboards or scripts.

---

## 📿 3. Governance-by-Audit (Beads)
Agentic development requires a **Versioned Task Ledger** to prevent amnesia and ensure accountability.

*   **The Bead**: Every atomic task (feature, bug, setup) is a "Bead."
*   **The Interface**: Human-readable roadmap ([**`task.md`**](file:///Users/gordonwong/WWWarehouse/task.md) in the root) and the official CLI (`bd list`).
*   **The Archive**: Machine-readable SQL ledger in `.beads/` (managed by Dolt).
*   **The Mandate**: "No Work Without a Bead." If it isn't in the ledger, it didn't happen.

---

## 🧪 4. The Testing Trinity
No code is "Done" until it passes precisely three layers of verification.

1.  **Unit Tests**: Verify isolated logic components (macros, functions).
2.  **Functional Tests**: Verify the specific "solve" for the current task.
3.  **Regression Tests**: Verify that the global system state (architecture, setup, historical logic) remains intact.

---

## 🐍 5. Environmental Portability (The Bootstrap)
The project must be capable of a **"One-Click Setup"** on any machine (Local vs. Cloud).

### **The Toolset Layer**
*   **Environment**: Use `direnv` and `.venv` for automatic activation.
*   **Task Abstraction**: Use a `Makefile` to hide complexity.
*   **Bootstrap**: Always provide a `setup.sh` that installs binaries, configures paths, and initializes the official governance ledger via `bd init`.

### **Model Routing Strategy**
Optimizing for performance and cost:
*   **Logic (Local)**: Local models (e.g., Ollama/Qwen) for reasoning, linting, and spec-drafting.
*   **Execution (Flash)**: High-speed cloud models for file-writing and terminal commands.
*   **Architecture (Pro)**: High-reasoning cloud models for Phase Gates and system audits.

---

## 🏥 6. The Triage Proxy
To prevent "Silent Failures," every project must have a **Triage Script** (`bin/triage.sh`).
*   **Function**: Audit paths, venv status, and binary vitality.
*   **Mandate**: Agents must run Triage before every major execution block.

---
*Created by the Wong Way Assistant for Gordon Wong | April 2026*
