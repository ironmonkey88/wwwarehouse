#!/usr/bin/env bash
set -e
echo "🛰️  Initializing Checkpoint Protocol..."

# 0. The Integrity Mandate: Verify Qualified Worker (Rule 1.6)
if [ ! -f .factory/current_mode ]; then
    echo "🔴 ERROR: Identity Lock Missing."
    echo "   You must perform the Qualified Worker Handshake first:"
    echo "   'python3 bin/verify_worker.py [mode_slug]'"
    exit 1
fi
CURRENT_MODE=$(cat .factory/current_mode)
echo "🛡️  Verified Persona: $CURRENT_MODE"

# 1. Verify Active Bead
ACTIVE_BEAD=$(bd list --status in_progress --json | python3 -c "import sys, json; data=json.load(sys.stdin); print(data[0]['id']) if data else print('')")
if [ -z "$ACTIVE_BEAD" ]; then
    echo "⚠️  ERROR: No active bead found. Claim a task via 'bd claim' first."
    exit 1
fi
echo "📍 Active Bead: $ACTIVE_BEAD"

# 2. Spec Validation (Rule 3.3.1 / SOP-005)
# Meta-tasks (starting with AG-) are exempt from the Requirement Gate.
if [[ ! "$ACTIVE_BEAD" =~ ^AG- ]]; then
    SPEC_FILE="factory/requirements/REQ-$ACTIVE_BEAD.md"
    echo "🔎 Validating SPEC for $ACTIVE_BEAD..."
    if ! python3 bin/validate_spec.py "$SPEC_FILE"; then
        echo "❌ ERROR: High-Integrity SPEC Missing or Invalid for $ACTIVE_BEAD."
        echo "   Every bead must have a validated requirement file in factory/requirements/."
        exit 1
    fi
fi

# 3. Seal Verification (Rule 3.3.1 / SOP-005)
# If this is a finalize/close attempt, we check for the Witness Seal.
if [[ "$*" == *"--close"* ]]; then
    if [ ! -f ".factory/sealed_beads/$ACTIVE_BEAD" ]; then
        echo "❌ ERROR: Bead $ACTIVE_BEAD is NOT SEALED."
        echo "   The Witness role must certify this work first:"
        echo "   'bin/seal $ACTIVE_BEAD --alpha --beta --gamma'"
        exit 1
    fi
    echo "🏅 Verification: TRIPLE-SEAL DETECTED."
fi

# 2. Stage Comprehensive Logic/Docs (White-list then Black-list)
echo "📦 Staging all project assets..."
git add .

# 3. Explicitly unstage data/binaries/environment bloat
echo "🧹 Filtering out binary/data bloat..."
git reset -- .DS_Store *.duckdb *.db .dolt/ .venv/ .venv_dbt_timer/ build_log.txt .DS_Store
# Ensure we dont accidentally unstage governance
git add factory/modes/ factory/sops/ task.md

# 4. Sync State with Remote
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📡 Syncing branch [$BRANCH] with remote..."
git fetch origin "$BRANCH" 2>/dev/null || echo "New branch detected."
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "0")

# 5. Local Save Point
COMMIT_MSG="checkpoint($ACTIVE_BEAD): $(git diff --cached --stat | tail -n 1 | xargs)"
git commit -m "$COMMIT_MSG" || echo "Nothing new to commit."

# 6. Atomic Sync Push
if [ "$REMOTE" != "0" ] && [ "$(git rev-parse HEAD)" != "$REMOTE" ]; then
    echo "📡 Pulling latest changes from remote..."
    git pull origin "$BRANCH" --rebase
fi

echo "🚀 Pushing to GitHub..."
git push origin "$BRANCH"

echo "✅ Checkpoint Successful."
