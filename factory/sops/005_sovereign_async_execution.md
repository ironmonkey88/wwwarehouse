# SOP-005: Sovereign Async Execution 🦅

## 1. Purpose
To ensure the **Assistant** remains responsive to the **Conductor** during long-running tasks (>30 seconds), preventing session "freezing." This procedure defines how to decouple execution from the primary chat loop.

## 2. Applicability
This SOP applies to all high-volume data maneuvers, including:
- Full bulk ingests (dlt)
- Large-scale refinery runs (dbt)
- Environment setups and bulk refactors
- Web crawls or external data fetches

## 3. The Decoupling Protocol
When a task is identified as "Long Running," the agent MUST:

1. **Redirect Output:** Use a background redirection to a specific log file in `.ignored/logs/`.
   - **Syntax:** `nohup [command] > .ignored/logs/[task_name].log 2>&1 &`
2. **Log the Identity:** Capture and report the **PID** (Process ID) of the newly spawned background task to the Conductor.
3. **Immediate Handoff:** Return control to the Conductor immediately after starting the job. **Do not use a blocking `command_status` call.**
4. **The Monitoring Bead:** Create or update a Bead in the task ledger indicating an "Active Background Stream."

## 4. The Tracker Loop
- The Conductor may ask "What's the status?" at any time.
- The Agent shall use the `watch.sh` utility to tail the log and report progress.
- If the log shows a failure, the Agent switches to **The Debugger** persona to address the root cause.

---
*Maintained by the Wong Way Data Factory | April 2026*
