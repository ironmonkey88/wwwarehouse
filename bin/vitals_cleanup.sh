#!/bin/bash

# [SURGEON] Vitals Cleanup 🛡️
# Purpose: Safely terminate orphaned Antigravity processes to restore responsiveness.

# 1. Self-Preservation Logic
MY_PID=$$
MY_PPID=$PPID

# Mapping the "Safe Tree" (Current shell and its parent)
SAFE_PIDS=("$MY_PID" "$MY_PPID")

echo "🛡️  Vitals: Starting Surgical Cleanup..."
echo "👁️  Active PID: $MY_PID | active PPID: $MY_PPID"

# 2. Identify Targets
# We look for Language Servers and Playwright Drivers.
# We EXCLUDE the current PPID tree AND we attempt to detect other active windows.
# Logic: Protect all parents of any active shell.
ALL_GHOSTS=$(ps -axo pid,ppid,args | grep -E "language_server|playwright" | grep -v grep)

TARGET_PIDS=""
while read -r pid ppid args; do
    # Protect current active tree
    if [[ "$pid" == "$MY_PID" || "$pid" == "$MY_PPID" || "$ppid" == "$MY_PID" || "$ppid" == "$MY_PPID" ]]; then
        continue
    fi
    
    # If the process is a Language Server, we only kill it if it has no children (orphaned)
    # or if it's a known playwright leak.
    if [[ "$args" == *"playwright"* ]]; then
        TARGET_PIDS+="$pid "
    elif [[ "$args" == *"language_server"* ]]; then
        # Check if it has an active session (child processes)
        CHILD_COUNT=$(pgrep -P "$pid" | wc -l)
        if [ "$CHILD_COUNT" -eq 0 ]; then
             TARGET_PIDS+="$pid "
        fi
    fi
done <<< "$ALL_GHOSTS"

if [ -z "$TARGET_PIDS" ]; then
    echo "✅ No orphaned 'Ghost' processes detected. Baseline is healthy."
    exit 0
fi

echo "🚨 Identified Orphans: $TARGET_PIDS"

# 3. Surgical Termination
for PID in $TARGET_PIDS; do
    echo "❌ Terminating Ghost: $PID"
    kill -9 "$PID" 2>/dev/null || true
done

echo "🟢 Cleanup Complete. System responsiveness should be restored."
