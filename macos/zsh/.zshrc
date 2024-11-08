# Enable Zsh autocompletion
autoload -Uz compinit && compinit

# Source aliases if file exists
if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi
