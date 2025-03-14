#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"



cp -i "$(dirname $(realpath "$0"))/etc/starship.toml" "$(get_home_config_dir)/starship.toml"
cp -i "$(dirname $(realpath "$0"))/etc/starship.zsh" "$(get_zshrcs_startup_files_dir)/starship.zsh"
