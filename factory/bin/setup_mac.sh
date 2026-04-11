#!/usr/bin/env bash

set -e

echo "===================================="
echo "WWWarehouse: Comprehensive Mac Setup"
echo "===================================="

# 1. Install Homebrew if not found
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "🍺 Homebrew found."
fi

# 2. Install System Dependencies
echo "📦 Installing system binaries via Homebrew..."
brew update
brew install python@3.11 terraform@1.10 duckdb dolt direnv google-cloud-sdk npm node@22

# 3. Handle Python 3.11 environment
echo "🐍 Initializing Python 3.11 Virtual Environment..."
if [ -d ".venv" ]; then
    echo "Existing .venv found. Recreating..."
    rm -rf .venv
fi

# Prefer the mac silicon path first, fallback to intel usr/local
if [ -f "/opt/homebrew/bin/python3.11" ]; then
    PYTHON_CMD="/opt/homebrew/bin/python3.11"
else
    PYTHON_CMD="/usr/local/bin/python3.11"
fi

$PYTHON_CMD -m venv .venv --prompt "WWWarehouse"

# 4. Bootstrap Pip Packages
echo "⚙️ Installing pip requirements..."
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 5. Initialize Governance Ledger
echo "📿 Bootstrapping Beads/Dolt Ledger..."
if [ ! -d "beads/.dolt" ]; then
    mkdir -p beads && cd beads
    dolt init
    dolt config --add user.email "factory@wwwarehouse.local" || true
    dolt config --add user.name "WWWarehouse Agent" || true
    dolt sql -q "CREATE TABLE IF NOT EXISTS tasks (id VARCHAR(10) PRIMARY KEY, title VARCHAR(255), status VARCHAR(20), methodology TEXT);"
    cd ..
else
    echo "Beads database already initialized."
fi
python3 sync_tasks_to_dolt.py || echo "Task sync skipped (script missing)."

echo "===================================="
echo "✅ Setup Complete!"
echo "Please run 'direnv allow' to automatically activate the environment."
echo "Use 'make dev-check' to verify tool dependencies."
echo "===================================="
