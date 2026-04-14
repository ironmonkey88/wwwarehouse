#!/bin/bash
# bin/clean_run.sh: Supreme Command Hygiene Wrapper (Bead 05)
# Strips ALL identified agent instruction fragments from the argument list.

# Comprehensive list of prohibited agent noise words
NOISE_WORDS=(
    "project" "session" "with" "the" "user" "leadership" "personas" 
    "phase" "retrospective" "main" "of" "subagent" "requested" "by" 
    "user." "requested." "session." "retrospective."
)

# Capture all arguments
ARGS=("$@")
CLEAN_ARGS=()

for arg in "${ARGS[@]}"; do
    is_noise=false
    # Convert arg to lowercase and strip trailing dots for comparison
    arg_clean=$(echo "$arg" | tr '[:upper:]' '[:lower:]' | sed 's/\.$//')
    
    for word in "${NOISE_WORDS[@]}"; do
        word_clean=$(echo "$word" | sed 's/\.$//')
        if [[ "$arg_clean" == "$word_clean" ]]; then
            is_noise=true
            break
        fi
    done
    
    if [ "$is_noise" = false ]; then
        CLEAN_ARGS+=("$arg")
    fi
done

# Execute the clean command
exec "${CLEAN_ARGS[@]}"
