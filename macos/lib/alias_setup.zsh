#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"


cp -i "$(dirname $(realpath "$0"))/etc/aliases.zsh" "$(get_zshrcs_startup_files_dir)/aliases.zsh"

mkdir -p "$(get_zshrcs_startup_files_dir)/aliases"
for FILE in "$(dirname $(realpath "$0"))/etc/aliases"/*; do
    cp -i "$FILE" "$(get_zshrcs_startup_files_dir)/aliases"
done
