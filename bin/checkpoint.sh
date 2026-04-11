#!/usr/bin/env bash
# ==============================================================================
# WWWarehouse: Checkpoint Protocol (CP-001)
# ==============================================================================
# Objective: Consistently version logic and docs without drift or errors.
# ==============================================================================

set -e

echo "🛰️  Initializing Checkpoint Protocol..."

# 1. Verify Active Bead
ACTIVE_BEAD=$(bd list --status in_progress --json | python3 -c "import sys, json; data=json.load(sys.stdin); print(data[0]['id']) if data else print('')")

if [ -z "$ACTIVE_BEAD" ]; then
    echo "⚠️  ERROR: No active bead found. Claim a task via 'bd claim' first."
    exit 1
fi
echo "📍 Active Bead: $ACTIVE_BEAD"

# 2. Prevent Common Push Failures
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📡 Syncing branch [$BRANCH] with remote..."
git fetch origin "$BRANCH" 2>/dev/null || echo "New branch detected."
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "0")

if [ "$REMOTE" != "0" ] && [ "$LOCAL" != "$REMOTE" ]; then
    echo "⚠️  WARNING: Local branch is divergent from remote. Attempting rebase..."
    git pull origin "$BRANCH" --rebase
fi

# 3. Stage relevant files (Logic, Docs, Configs)
echo "📦 Staging governance and logic assets..."
# Specifically ignore data, binaries, and local environments
git add factory/modes/ factory/skills/ factory/sops/ factory/DOCUMENT_REGISTRY.md
git add transformation/dbt/ analytics/evidence/ ingestion/
git add bin/*.sh requirements.txt task.md

# 4. Filter out common bloat
git reset -- .DS_Store *.duckdb *.db .dolt/ .venv/ .venv_dbt_timer/ build_log.txt

# 5. Review Diff Stat
echo "🔍 Commit Preview:"
git diff --cached --stat

# 6. Commit and Push
COMMIT_MSG="checkpoint($ACTIVE_BEAD): $(git diff --cached --stat | tail -n 1 | xargs)"
echo "💾 Committing: $COMMIT_MSG"
git commit -m "$COMMIT_MSG" || echo "Nothing to commit."

echo "🚀 Pushing to GitHub..."
git push origin master

echo "✅ Checkpoint Successful."
