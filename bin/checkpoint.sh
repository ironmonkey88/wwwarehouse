#!/usr/bin/env bash
set -e
echo "🛰️  Initializing Checkpoint Protocol..."

# 1. Verify Active Bead
ACTIVE_BEAD=$(bd list --status in_progress --json | python3 -c "import sys, json; data=json.load(sys.stdin); print(data[0]['id']) if data else print('')")
if [ -z "$ACTIVE_BEAD" ]; then
    echo "⚠️  ERROR: No active bead found. Claim a task via 'bd claim' first."
    exit 1
fi
echo "📍 Active Bead: $ACTIVE_BEAD"

# 2. Stage relevant files (Logic, Docs, Configs)
echo "📦 Staging governance and logic assets..."
git add factory/modes/ factory/skills/ factory/sops/ factory/DOCUMENT_REGISTRY.md
git add transformation/dbt/ analytics/evidence/ ingestion/
git add bin/*.sh requirements.txt task.md .gitignore .envrc
git reset -- .DS_Store *.duckdb *.db .dolt/ .venv/ .venv_dbt_timer/ build_log.txt

# 3. Prevent Common Push Failures (Sync AFTER staging)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📡 Syncing branch [$BRANCH] with remote..."
git fetch origin "$BRANCH" 2>/dev/null || echo "New branch detected."
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "0")

if [ "$REMOTE" != "0" ] && [ "$LOCAL" != "$REMOTE" ]; then
    echo "⚠️  WARNING: Local branch is divergent from remote. Attempting rebase..."
    # Now that changes are (conceptually) staged, we still need them stashed or committed to rebase.
    # We will commit FIRST, then pull --rebase.
fi

# 4. Commit (Local Save Point)
COMMIT_MSG="checkpoint($ACTIVE_BEAD): $(git diff --cached --stat | tail -n 1 | xargs)"
git commit -m "$COMMIT_MSG" || echo "Nothing new to commit."

# 5. Sync Push
if [ "$REMOTE" != "0" ] && [ "$(git rev-parse HEAD)" != "$REMOTE" ]; then
    echo "📡 Pulling latest changes..."
    git pull origin "$BRANCH" --rebase
fi

echo "🚀 Pushing to GitHub..."
git push origin "$BRANCH"

echo "✅ Checkpoint Successful."
