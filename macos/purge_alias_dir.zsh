#!/usr/bin/env zsh

ZSHRCS_ALIASES_DIR="$HOME/.zshrcs/src/aliases"

for FILE in "$ZSHRCS_ALIASES_DIR"/*; do
    if [[ -e "$(dirname $(realpath "$0"))/aliases/$FILE:t" ]]; then
        echo "\e[1;34m$FILE:t in the local aliases directory exists in this repository.\e[0m"
    else
        printf "\e[1;33m"
        read -q "ANSWER?$FILE:t in the local aliases directory is not a file in this repository. Would you like to trash it? [y/n]: "
        print "\e[0m"

        if [[ "$ANSWER" == "y" ]]; then
            trash "$FILE"
            echo "\e[1;31m$FILE trashed.\e[0m"
        else
            echo "\e[1;36m$FILE ignored.\e[0m"
        fi
    fi
done
