HOME_CONFIG_DIR="$HOME/.config"
SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
SOURCE_STARSHIP_TOML_PATH="$SCRIPT_DIR/starship.toml"
TARGET_STARSHIP_TOML_PATH="$HOME_CONFIG_DIR/starship.toml"

mkdir -p "$HOME_CONFIG_DIR"
cp -i "$SOURCE_STARSHIP_TOML_PATH" "$TARGET_STARSHIP_TOML_PATH"
