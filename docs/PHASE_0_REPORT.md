# 10x Dry Run Report: Phase 0 (Agentic Setup) 🧪

This report documents 10 simulated "What If?" scenarios to bulletproof the factory foundation. 

| DR # | Scenario | Failure Mode | Solution / Improvement |
| :--- | :--- | :--- | :--- |
| **01** | **The Path Ghost** | `dbt` commands fail because `/usr/local/bin` is missing. | **Bulletproof:** Explicitly inject `/usr/local/bin` via `.envrc`. |
| **02** | **The Pip Deadlock** | `dbt-core 1.9` and `dlt` have conflicting sub-dependencies. | **Bulletproof:** Pin stable versions (`dbt-core==1.8.0`). |
| **03** | **The Brew Styx** | `brew install` stalls due to an existing lock file. | **Bulletproof:** Pre-check with `brew update`. |
| **04** | **The Venv Fog** | User activates the wrong virtual environment. | **Bulletproof:** Use `python -m venv .venv --prompt "WWWarehouse"`. |
| **05** | **The Auth Void** | GCS Tasks fail because `gcloud` is unauthenticated. | **Bulletproof:** Add a gated check `gcloud auth list`. |
| **06** | **The Remote Paradox** | Dolt links to GCS before the bucket exists. | **Bulletproof:** Defer the Dolt GCS remote addition. |
| **07** | **The Compiler Trap** | A sub-lib fails building on Python 3.11. | **Bulletproof:** Use `--only-binary :all:`. |
| **08** | **The Beads Deluge** | Bootstrapping fails if CSV has special characters. | **Bulletproof:** Use script-based import. |
| **09** | **The Path Entropy** | Multiple Python versions cause "Library Mismatch". | **Bulletproof:** Use absolute paths (`/usr/local/bin/python3.11`). |
| **10** | **The Rules Blindness** | Future agents ignore `.kilorules` because it's only text. | **Bulletproof:** Reference rules in script docstrings. |

---

## 🚀 Optimization Strategy: The "Bulletproof" Phase 0
Based on these 10 simulations, the foundation is now:
1.  **Path-Locked**: `/usr/local/bin` is in the context.
2.  **Version-Pinned**: Reverted to `dbt-core==1.8.0`.
3.  **Visually Prompted**: Custom venv naming.

*Dry Run Certified by Antigravity | April 2026*
