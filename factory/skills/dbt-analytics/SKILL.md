---
name: dbt-analytics
description: >-
  Skills for analytics engineering in dbt (The Refinery layer). Use when acting as 
  "The Coder" or "The Debugger" to model data, write TDD mocks, and troubleshoot runs.
metadata:
  category: data-engineering
  author: The Swarm (Coder/Debugger)
---

# dbt Analytics Engineering 

This skill defines the behavioral boundaries and execution paths for dbt operations in the WWWarehouse.

## 1. Model Development (The Coder Mode)

When tasked with creating a new model (`Silver` or `Gold` layers):
1. **Context First:** Read `dbt_project.yml` and the `schema.yml` of the relevant layer before writing code.
2. **Lineage Adherence:** You MUST use the `ref()` or `source()` macros. Hardcoded table references will fail the Lineage Mandate.
3. **DuckDB Specifics:** Ensure data types align with DuckDB. If casting, use DuckDB syntax (e.g., `CAST(x AS VARCHAR)`).

## 2. Test-Driven Mocks (The Witness Mode)

Before marking a feature complete, you must ensure it passes "The Testing Trinity".

If building unit tests, follow the dbt `unit_tests:` YAML structure:
1. Define the input mock (`given:`)
2. Define the expected output (`expect:`)
3. Execute validation via `dbt test --select [model_name]`

## 3. Troubleshooting Run Failures (The Debugger Mode)

If a `dbt run` or `dbt test` fails, **DO NOT randomly guess or rewrite the model code based on the terminal summary.**

Follow this disciplined diagnostic loop:

1. **Read the Compiled SQL:** Locate the failed model in the `target/compiled/` directory. Use the `view_file` tool to read the exact SQL dbt generated.
2. **Read the raw error:** Examine the `target/run_results.json` to find the exact database error code.
3. **Run the pure query:** Use `run_command` with DuckDB to manually execute the `target/compiled/` SQL to see the exact row or syntax failure.

*Fix the logic only after the specific broken lineage or cast is identified via the compiled target.*
