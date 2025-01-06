#!/usr/bin/env zsh

ZSHRCS_DIR="$HOME/.zshrcs"
ZSHRCS_STARTUP_FILES_DIR="$ZSHRCS_DIR/src"


# Enable Zsh autocompletion
autoload -Uz compinit && compinit

mkdir -p "$ZSHRCS_STARTUP_FILES_DIR"
for FILE in "$ZSHRCS_STARTUP_FILES_DIR"/*; do
    source "$FILE"
done
