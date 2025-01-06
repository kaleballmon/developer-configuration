#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"


cp -i "$(dirname $(realpath "$0"))/etc/zsh_aliases.zsh" "$(get_zshrcs_startup_files_dir)/zsh_aliases.zsh"