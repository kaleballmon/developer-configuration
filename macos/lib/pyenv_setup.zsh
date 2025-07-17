#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"

cp -i "$(dirname $(realpath "$0"))/etc/pyenv.zsh" "$(get_zshrcs_dir)/src/pyenv.zsh"
