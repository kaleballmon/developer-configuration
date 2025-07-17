#!/usr/bin/env zsh

function full-rebase() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <branch>"
	  return 1
	fi

	git checkout $1
	git fetch
	git pull
	git checkout -
	git rebase -i --autosquash $1
}

function _full-rebase_completion() {
  compadd master main 
}

compdef _full-rebase_completion full-rebase
