#!/usr/bin/env zsh

get_home_config_dir () {
  echo "$HOME/.config"
}

get_zshrc_path () {
  echo "$HOME/.zshrc"
}

get_zshrcs_dir () {
  echo "$HOME/.zshrcs"
}

get_zshrcs_startup_files_dir () {
  echo "$(get_zshrcs_dir)/src"
}
