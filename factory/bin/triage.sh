#!/usr/bin/env bash

# WWWarehouse Triage Proxy
# Used to quickly audit the environment before heavy agentic tasks.

set -e

echo "--- 🏥 Factory Triage: $(date) ---"

# 1. Path Audit
echo -n "Paths: "
if [[ ":$PATH:" == *":/usr/local/bin:"* ]] && [[ ":$PATH:" == *":/opt/homebrew/bin:"* ]]; then
    echo "✅ PROPER"
else
    echo "❌ MISCONFIGURED"
fi

# 2. Venv Audit
echo -n "Venv: "
if [[ "$VIRTUAL_ENV" == *"WWWarehouse"* ]]; then
    echo "✅ ACTIVE ($(basename $VIRTUAL_ENV))"
else
    echo "❌ INACTIVE (Switching to direnv layout...)"
fi

# 3. Tool Vitality
echo -n "Core: "
(command -v dbt >/dev/null && command -v dlt >/dev/null && command -v dolt >/dev/null) && echo "✅ ALIVE" || echo "❌ MISSING"

# 4. Agent Vitality
echo -n "Kilo: "
(command -v kilo >/dev/null) && echo "✅ READY" || echo "⏳ INSTALLING"

echo "------------------------------------"
