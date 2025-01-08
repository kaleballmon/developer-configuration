#!/usr/bin/env zsh

mkdir -p "$HOME/.zshrcs/src/aliases"
for FILE in "$HOME/.zshrcs/src/aliases"/*; do
    source "$FILE"
done
