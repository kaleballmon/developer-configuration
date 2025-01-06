#!/bin/zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"


cp -i "$(dirname $(realpath "$0"))/etc/zsh_syntax_search.zsh" "$(get_zshrcs_startup_files_dir)/zsh_syntax_search.zsh"