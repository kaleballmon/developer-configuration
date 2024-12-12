#!/usr/bin/env zsh

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ALIASES="$SCRIPT_DIR/aliases"
ZSHRC="$HOME/.zshrc"

IFS=$'\n'  # make new lines the only separtor
set -f  # disable globbing

# Create .zshrc file if it doesn't exist
if [[ ! -f "$ZSHRC" ]]
then
  echo "# Kaleb's .zshrc" >> "$ZSHRC"
  echo >> "$ZSHRC"
fi

# Add aliases to zshrc if they aren't there yet
for i in $(cat < "$ALIASES"); do
  if ! grep -q "$i" "$ZSHRC"
  then
    echo "$i" >> "$ZSHRC"
  fi
done
