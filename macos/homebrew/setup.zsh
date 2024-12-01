#!/usr/bin/env zsh


HOMEBREW_EXEC_PATH='/opt/homebrew/bin/brew'
ZPROFILE="$HOME/.zprofile"
ZSHRC="$HOME/.zshrc"


# Create .zprofile and .zshrc files if thety don't exist.
if [[ ! -f "$ZPROFILE" ]]
then
  echo "# Kaleb's .zprofile" >> "$ZPROFILE"
  echo >> "$ZPROFILE"
else
  echo "profile dont exist"
fi

if [[ ! -f "$ZSHRC" ]]
then
  echo "# Kaleb's .zrc" >> "$ZSHRC"
  echo >> "$ZSHRC"
fi


# Install Homebrew if it isn't already installed.
# We only check for the command here because the Homebrew installation is idempotent,
# so if the Homebrew initialization command isn't in the shell startup file but the files are installed,
# running the install script again is safe.
if ! command -v brew 2>&1 >/dev/null
then
  HOMEBREW_INSTALL_URL='https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'

  /bin/bash -c "$(curl -fsSL "$HOMEBREW_INSTALL_URL")"

  eval "$("$HOMEBREW_EXEC_PATH" shellenv)"
fi


# Add Homebrew initialization command to shell startup file if it doesn't exist.
if ! grep -q 'eval "$('"$HOMEBREW_EXEC_PATH"' shellenv)"' "$ZPROFILE"
then
  echo '# Initialize Homebrew' >> "$ZPROFILE"
  echo 'eval "$('"$HOMEBREW_EXEC_PATH"' shellenv)"' >> "$ZPROFILE"
  echo >> "$ZPROFILE"
fi


# Install packages in the Brewfile
SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
BREWFILE_PATH="$SCRIPT_DIR/Brewfile"

brew bundle install --file="$BREWFILE_PATH"


# Delta Configuration
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
git config --global delta.side-by-side true
git config --global delta.line-numbers true


# fzf Configuration
# Add fzf initialization command to shell startup file if it doesn't exist.
if ! grep -q 'source <(fzf --zsh)' "$ZPROFILE"
then
  echo '# Initialize fzf' >> "$ZPROFILE"
  echo 'source <(fzf --zsh)' >> "$ZPROFILE"
  echo >> "$ZPROFILE"
fi


# pyenv Configuration
if ! grep -q '# Initialize pyenv' "$ZPROFILE"
then
  echo  '# Initialize pyenv' >> "$ZPROFILE"
fi

if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' "$ZPROFILE"
then
  echo  'export PYENV_ROOT="$HOME/.pyenv"' >> "$ZPROFILE"
fi

if ! grep -q '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' "$ZPROFILE"
then
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> "$ZPROFILE"
fi

if ! grep -q 'eval "$(pyenv init -)"' "$ZPROFILE"
then
  echo 'eval "$(pyenv init -)"' >> "$ZPROFILE"
fi


# Starship Configuration
if ! grep -q 'eval "$(starship init zsh)"' "$ZSHRC"
then
  echo '# Initialize Startship' >> "$ZSHRC"
  echo 'eval "$(starship init zsh)"' >> "$ZSHRC"
  echo >> "$ZSHRC"
fi


# Zsh syntax and autocompletion Configuration
if ! grep -q '# Initialize Zsh syntax and autocompletion' "$ZSHRC"
then
  echo  '# Initialize Zsh syntax and autocompletion' >> "$ZSHRC"
fi

if ! grep -q "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "$ZSHRC"
then
  echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$ZSHRC"
fi

if ! grep -q "source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" "$ZSHRC"
then
  echo "source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" >> "$ZSHRC"
fi

if ! grep -Fq 'bindkey '"'"'^[[A'"'"' history-substring-search-up' "$ZSHRC"
then
  echo 'bindkey '"'"'^[[A'"'"' history-substring-search-up' >> "$ZSHRC"
fi

if ! grep -Fq 'bindkey '"'"'^[[B'"'"' history-substring-search-down' "$ZSHRC"
then
  echo 'bindkey '"'"'^[[B'"'"' history-substring-search-down' >> "$ZSHRC"
fi

# Restart the current shell session
exec zsh
