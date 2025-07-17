#!/usr/bin/env zsh

# *c*heckout *r*ecent *b*ranch
crb() {
  local count="$1"
  if [[ -z "$count" ]]; then
    echo "Usage: crb <number>"
    return 1
fi

local branches=("${(@f)$(git branch --sort=-committerdate | tail -n +2 | head -n "$count" | sed 's/^  //' )}")

  if [[ ${#branches[@]} -eq 0 ]]; then
    echo "No branches found."
    return 1
  fi

  echo "Select a branch to checkout:"
  select branch in "${branches[@]}"; do
    if [[ -n "$branch" ]]; then
      git checkout "$branch"
      break
    else
      echo "Invalid selection."
    fi
  done
} 
