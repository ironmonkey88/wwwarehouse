#!/bin/bash

# polecat.sh: The Frugal Stack Delegation Bridge 🌉
# This utility allows the cloud conductor (Antigravity) to offload 
# coding and documentation tasks to the local Ollama instance.

DEFAULT_MODEL="qwen2.5-coder:7b"
SYSTEM_PROMPT="You are The Polecat, a local workers in the Wong Way Data Factory. You are fast, frugal, and precise. You specialize in code formatting, docstring generation, and boilerplate. Respond ONLY with the requested output. No conversational filler."

function show_help() {
    echo "Usage: bin/polecat.sh [prompt] [file_path]"
    echo ""
    echo "Examples:"
    echo "  bin/polecat.sh 'Format this python code' main.py"
    echo "  echo 'Refactor this' | bin/polecat.sh"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
    exit 0
fi

# Handle TTY/Piping
if [ -p /dev/stdin ]; then
    INPUT=$(cat -)
    PROMPT="$1"
else
    if [ -z "$1" ]; then
        show_help
        exit 1
    fi
    PROMPT="$1"
    if [ ! -z "$2" ]; then
        INPUT=$(cat "$2")
    fi
fi

# Construct the full request
FULL_PROMPT="${SYSTEM_PROMPT}\n\nTask: ${PROMPT}\n\nInput:\n${INPUT}"

# Execute Ollama
ollama run "$DEFAULT_MODEL" "$FULL_PROMPT"
