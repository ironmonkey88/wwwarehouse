#!/usr/bin/env bash

# watch.sh: The Sovereign Tracker Tool 🛰️
# Usage: factory/bin/watch.sh [task_name]

LOG_DIR=".ignored/logs"
TASK_NAME=$1

if [ -z "$TASK_NAME" ]; then
    echo "❌ Usage: factory/bin/watch.sh [task_name]"
    exit 1
fi

LOG_FILE="$LOG_DIR/$TASK_NAME.log"
PID_FILE="$LOG_DIR/$TASK_NAME.pid"

if [ ! -f "$LOG_FILE" ]; then
    echo "❌ No log file found for '$TASK_NAME' at $LOG_FILE"
    exit 1
fi

echo "--- Status Report: $TASK_NAME ---"
echo "Log Location: $LOG_FILE"

# Check if process is still running via PID file
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        echo "⏳ Status: RUNNING"
        echo "PID: $PID"
    else
        echo "🏁 Status: FINISHED (Process $PID exited)"
    fi
else
    # Fallback checking for the task name in ps
    RUNNING=$(ps aux | grep "$TASK_NAME" | grep -v grep | grep -v "watch.sh" || true)
    if [ -z "$RUNNING" ]; then
        echo "🏁 Status: NOT RUNNING"
    else
        echo "⏳ Status: RUNNING (Inferred)"
    fi
fi

echo ""
echo "--- Last 5 Lines of Progress ---"
tail -n 5 "$LOG_FILE"
echo "--------------------------------"
