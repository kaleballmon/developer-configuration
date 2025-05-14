#!/usr/bin/env zsh

function copy_file_with_confirmation_if_different() {
	local src_file="$1"	
	local dest_dir="$2"	

	# If file does not exist copy it over
	if [[ ! -a "$dest_dir/$src_file:t" ]]; then
		cp "$src_file" "$dest_dir"
		echo "\e[1;32mCopied $src_file:t to the configuration directory.\e[0m"	
	# If files are identical do nothing
	elif diff -q "$src_file" "$dest_dir/$src_file:t" >/dev/null; then
		echo "\e[1;34m$src_file:t already exists in the same state in the configuration directory.\e[0m"	
	# If file is different ask before overriding
	else
		printf "\e[1;33m"
		cp -i "$src_file" "$dest_dir"
		printf "\e[0m"
	fi
}

source "$(dirname $(realpath "$0"))/utils/config_path_getters.zsh"

ZSHRCS_ALIASES_DIR="$(get_zshrcs_startup_files_dir)/aliases"

mkdir -p "$ZSHRCS_ALIASES_DIR"
copy_file_with_confirmation_if_different "$(dirname $(realpath "$0"))/etc/aliases.zsh" "$(get_zshrcs_startup_files_dir)"

for FILE in "$(dirname $(realpath "$0"))/etc/aliases"/*; do
	copy_file_with_confirmation_if_different "$FILE" "$ZSHRCS_ALIASES_DIR"
done
