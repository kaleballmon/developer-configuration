# Homebrew Configuration
This directory holds Homebrew configurations I share across various MacOS machines.

The most important file here is the [Brewfile](https://thoughtbot.com/blog/brewfile-a-gemfile-but-for-homebrew),
which contains the packages I install with brew generally, regardless of what the machine is for. Items should
only be added to the Brewfile in this directory if it is that pervasive across the MacOS machines I use.

## Using the Brewfile
There are multiple ways to use the Brewfile in this repository.

### Copy to root
This Brewfile can be copied to the user root directory (`~`) and sourced.

```shell
cp path/to/developer-configuration/macos/homebrew/Brewfile ~/Brewfile
brew bundle install
```

In this method, getting any updates from the Brewfile in the repository will have to be done manually.

**This method is recommended when setting up a machine if you will create a Brewfile that are specific to the machine.**

To see which lines in the repository's Brewfile that aren't in your local machine's Brewfile, run this command

```shell
comm -13 <(sort ~/Brewfile) <(sort path/to/developer-configuration/macos/homebrew/Brewfile)
```

### Direct install
You can also simply install the specific packages in the Brewfile.

```shell
brew bundle install --file=path/to/developer-configuration/macos/homebrew/Brewfile
```

**This method is recommended when setting up a machine if you do not plan on creating a Brewfile that is specific to the machine.**

### Symlink to root
You can symlink the Brewfile in the user root directory to this Brewfile and souce it.

```shell
ln -s /absolute/path/to/developer-configuration/macos/homebrew/Brewfile ~/Brewfile
brew bundle install
```

This way, whenever changes are pushed to the Brewfile in this repository, they will automatically be added
to the Brewfile the machine is looking at.

## Brewfile Formulae Listing
### [zsh-history-substring-search](https://formulae.brew.sh/formula/zsh-history-substring-search)
A Zsh port of Fish shell's history search.

**Note: Extra configuration is needed for this to work automatically on shell startups.**

### [zsh-syntax-highlighting](https://formulae.brew.sh/formula/zsh-syntax-highlighting)
Fish shell-like syntax highlighting for Zsh.

**Note: Extra configuration is needed for this to work automatically on shell startups.**
