# Retrospective: Phase 0.3 (System Load & Performance) 📉

This retrospective focuses on the performance impact of integrating the **Local Polecat** into the 2019 MacBook Pro environment.

## 🐢 Performance Observations
- **Action**: Smoke test (Generating one docstring using `qwen2.5-coder:7b`).
- **Observed Latency**: **~6 minutes** (03:13:16 to 03:19:21).
- **Normal Expectation**: 30–60 seconds.
- **User Feedback**: "System load was quite high."

## 🔍 Root Cause Analysis: Is Ollama "Too Much"?
A 2019 MacBook Pro (Intel-based) faces specific challenges with 7B+ parameter models:

1.  **Inference Bottleneck**: On Intel Macs, Ollama relies heavily on the CPU or the AMD Radeon Pro GPU features (Metal). If the model doesn't fit entirely in the GPU's VRAM (usually 4GB–8GB on that model), it spills to system RAM (unified memory wasn't a thing yet), causing massive **I/O wait** and thermal throttling.
2.  **Context Bloat**: I passed the entire `councilor_ingest.py` file into the prompt. While small, this still increases the "Prefill" compute requirement.
3.  **Concurrency**: Running Antigravity (cloud browser agent), local dlt ingestion, and Ollama simultaneously likely exhausted the machine's thermal budget.

## ⚖️ The Frugal Trade-off
The **Frugal Agentic Stack** is about efficiency. If a local model takes 6 minutes and pins the CPU at 100%, the **Token-to-Time cost** is no longer in our favor. We are saving cents in API credits but losing significant productivity and "hardware health."

## 🚀 Recommendations for Improvement

### 1. Model Downsizing (The "Mini" Polecat)
We should switch the default `bin/polecat.sh` model to a lighter variant:
- **`llama3.2:1b`**: Extremely fast, low RAM footprint. Best for simple boilerplate.
- **`llama3.2:3b`**: The "Goldilocks" model for Intel Macs. High coding intelligence with much lower overhead than 7B.

### 2. Selective Delegation
The Mayor (me) should only use the local Polecat for:
- Non-urgent background tasks (generating unit tests while I think about other things).
- Small snippets (under 50 lines).

### 3. Resource Capping
- Instruct Ollama to use lower thread counts to prevent total system freeze.

---
*Authored by: The Mayor*
