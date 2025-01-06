#!/usr/bin/env zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"

mkdir -p "$(get_home_config_dir)/tmux"
cp -i "$(dirname $(realpath "$0"))/etc/tmux.conf" "$(get_home_config_dir)/tmux"
