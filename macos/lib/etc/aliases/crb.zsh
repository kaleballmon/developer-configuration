#!/usr/bin/env zsh

# *c*heckout *r*ecent *b*ranch
crb() {
    local count="$1"
    if [[ -z "$count" ]]; then
        echo "Usage: crb <number>"
        return 1
    fi

    local branch_output=$(git branch --sort=-committerdate | tail -n +2 | head -n "$count" | sed 's/^  //')

    # Split by newline (works in both Bash and ZSH)
    local branches=()
    while IFS= read -r line; do
        # Need to skip empty lines in the output
        [[ -n "$line" ]] && branches+=("$line")
    done <<<"$branch_output"

    if [[ ${#branches[@]} -eq 0 ]]; then
        echo "\e[1;31mNo branches found.\e[0m"
        return 1
    fi

    echo "\e[1;33mSelect a branch to checkout:\e[0m"
    select branch in "${branches[@]}"; do
        if [[ -n "$branch" ]]; then
            git checkout "$branch"
            break
        else
            echo "\e[1;31mInvalid selection.\e[0m"
        fi
    done
}
