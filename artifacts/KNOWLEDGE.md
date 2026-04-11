# WWWarehouse Learning Log (Deep Memory) 🧠

This document is the "Continuous Learning" repository for the project. It stores non-obvious insights, agentic discoveries, and tactical "gotchas" that are too granular for the README but critical for future performance.

---

## 📅 [2026-04-09] Phase 0 Summary

*   **Insight (Tooling)**: `dbt-core 1.8.0` has a Mac-specific CLI parsing error (`Could not parse version "1.0.0.40.15"`) that is non-blocking. Do not attempt to fix via pip re-installs; it is a known upstream regex mismatch.
*   **Insight (Governance)**: The official `beads` CLI uses `bd list --all` to show closed tasks, but default `bd list` only shows open/blocked items. Use Hash IDs for all cross-references.
*   **Insight (Environment)**: `direnv` is susceptible to path amnesia if the shell is opened in a subdirectory before the root. Always `cd` to root to re-polarize the environment.

## 📅 [2026-04-10] The Million-Row Scaling Lessons (311)

*   **Insight (Environment Sovereignty)**: `source activate` in agentic subshells is non-persistent. **Direct Binary Pathing** (`./.venv/bin/python3`) is the only sovereign way to ensure the environment remains active across multi-turn shell commands.
*   **Insight (The Binary Stamp)**: Files in `bin/` must have a **Shebang Header** (`#!/usr/bin/env python3`) and a **Permission Stamp** (`chmod +x`). Without these, shell-execution fails with `import: command not found` errors. 🛡️
*   **Insight (Audit Jitter)**: High-velocity datasets (like live 311 tickets) drift during the ingestion window. Audits must use the **Locked Handshake** protocol—fetching the `MAX(id)` at the start of ingestion and auditing against that fixed point rather than the live source total.
*   **Insight (Evidence Components)**: Always check `package.json` for the installed version of Evidence.dev before implementing UI components (e.g., `BarChart` vs `DonutChart`) to prevent build regressions.

---
*Maintained by the Wong Way Assistant.*
