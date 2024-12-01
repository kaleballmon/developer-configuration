# Homebrew Configuration
This directory holds Homebrew configurations I share across various MacOS machines.

The most important file here is the [Brewfile](https://thoughtbot.com/blog/brewfile-a-gemfile-but-for-homebrew),
which contains the packages I install with brew generally, regardless of what the machine is for. Items should
only be added to the Brewfile in this directory if it is that pervasive across the MacOS machines I use.


## Using the Brewfile
It is recommended to use the `setup.zsh` script in this directory to install packages and configure your shell
to use Homebrew. The script also includes setup for the packages.

Simply execute the script from your terminal:
```zsh
./path/to/this/setup.zsh
```


## Brewfile Formulae Listing
### [delta](https://formulae.brew.sh/formula/git-delta)
A better `git diff` pager.

### [fzf](https://formulae.brew.sh/formula/fzf)
A general-purpose command-line fuzzy finder.

### [pyenv](https://formulae.brew.sh/formula/pyenv)
Python version management.

### [starship](https://formulae.brew.sh/formula/starship)
The [starship](https://starship.rs/) cross-shell prompt.

### [the_silver_searcher](https://formulae.brew.sh/formula/the_silver_searcher)
The `ag` command, which is a code-search commandline utility.

### [tmux](https://formulae.brew.sh/formula/tmux)
Terminal multiplexer.

### [zsh-history-substring-search](https://formulae.brew.sh/formula/zsh-history-substring-search)
A Zsh port of Fish shell's history search.

### [zsh-syntax-highlighting](https://formulae.brew.sh/formula/zsh-syntax-highlighting)
Fish shell-like syntax highlighting for Zsh.


## Brewfile Cask Listing
### [font-fira-code-nerd-font](https://formulae.brew.sh/cask/font-fira-code-nerd-font)
The Fira Code Nerd Font for use as my terminal font.
