#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"

cp -i "$(dirname $(realpath "$0"))/etc/startup.zsh" "$(get_zshrcs_dir)/startup.zsh"

if ! grep -q "source $(get_zshrcs_dir)/startup.zsh" "$(get_zshrc_path)"; then
    echo >>"$(get_zshrc_path)"
    echo "source $(get_zshrcs_dir)/startup.zsh" >>"$(get_zshrc_path)"
fi
