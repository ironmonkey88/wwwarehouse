#!/usr/bin/env bash
# WWWarehouse: Laptop Independence Verifier (High Performance)
# Scans source logic for hardcoded local paths efficiently.

USER_NAME=$(whoami)
echo "🔍 Verifying project portability (User: $USER_NAME)..."

# Active logic and documentation
TARGETS="factory bin transformation ingestion analytics docs infra README.md task.md .antigravity"

# We use native exclusions to skip tool-generated bloat entirely.
LEAKS=$(grep -r "/Users/$USER_NAME" $TARGETS 2>/dev/null \
    --exclude-dir=logs \
    --exclude-dir=target \
    --exclude-dir=archive \
    --exclude-dir=__pycache__ \
    --exclude-dir=.venv* | grep -v "check_laptop_leaks.sh")

if [ -n "$LEAKS" ]; then
    echo "❌ Leak Detected in logic/docs:"
    echo "$LEAKS" | head -n 10
    exit 1
fi

echo "✅ Portability Check Passed. The Logic is sovereign."
exit 0
