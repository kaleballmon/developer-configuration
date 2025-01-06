#!/bin/zsh

source "$(dirname $(realpath "$0"))/lib/utils/config_path_getters.zsh"

touch $(get_zshrc_path)
mkdir -p $(get_zshrcs_dir)
mkdir -p $(get_zshrcs_startup_files_dir)
mkdir -p $(get_home_config_dir)


for FILE in "$(dirname $(realpath "$0"))/lib"/*; do
  if [[ -f "$FILE" ]]; then
    source "$FILE"
  fi
done