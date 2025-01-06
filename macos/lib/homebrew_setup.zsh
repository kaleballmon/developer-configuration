#!/bin/zsh

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle install --file="$(dirname $(realpath "$0"))/etc/Brewfile"

cp -i "$(dirname $(realpath "$0"))/etc/homebrew.zsh" "$(get_zshrcs_startup_files_dir)/homebrew.zsh"


# Delta Configuration
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
git config --global delta.side-by-side true
git config --global delta.line-numbers true