#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"

cp -i "$(dirname $(realpath "$0"))/etc/fzf.zsh" "$(get_zshrcs_dir)/src/fzf.zsh"
