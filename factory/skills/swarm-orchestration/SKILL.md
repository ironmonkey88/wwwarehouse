# Skill: Swarm Orchestration (The Coordinator) 🐝

## Objective
Manage the tactical handoffs and signaling between specialized practitioners.

## Tactical Instructions

### 1. The Signaling Logic
- When a task is completed, update the 'task.md' with a 'Handover' marker for the next worker.
- Format: `- [x] Task Name (Handover -> @worker_id)`.

### 2. Dependency Management
- Never start a 'Transformation' task until the 'Ingestion' bead is closed.
- Never start a 'Plating' task until the 'Refinery' handshake passes.

### 3. Context Ferrying
- When handing over, provide a summary of the 'Binary State' (e.g., "Bronze table 'raw_data' is ready with 1,000 rows").
