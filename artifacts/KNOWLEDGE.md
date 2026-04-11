# WWWarehouse Learning Log (Deep Memory) 🧠

This document is the "Continuous Learning" repository for the project. It stores non-obvious insights, agentic discoveries, and tactical "gotchas" that are too granular for the README but critical for future performance.

---

## 📅 [2026-04-09] Phase 0 Summary

*   **Insight (Tooling)**: `dbt-core 1.8.0` has a Mac-specific CLI parsing error (`Could not parse version "1.0.0.40.15"`) that is non-blocking. Do not attempt to fix via pip re-installs; it is a known upstream regex mismatch.
*   **Insight (Governance)**: The official `beads` CLI uses `bd list --all` to show closed tasks, but default `bd list` only shows open/blocked items. Use Hash IDs for all cross-references.
*   **Insight (Environment)**: `direnv` is susceptible to path amnesia if the shell is opened in a subdirectory before the root. Always `cd` to root to re-polarize the environment.

---
*Maintained by the Wong Way Assistant.*
