# Homebrew Configuration
This directory holds Homebrew configurations I share across various MacOS machines.

The most important file here is the [Brewfile](https://thoughtbot.com/blog/brewfile-a-gemfile-but-for-homebrew),
which contains the packages I install with brew generally, regardless of what the machine is for. Items should
only be added to the Brewfile in this directory if it is that pervasive across the MacOS machines I use.

## Using this Brewfile
There are multiple ways to use the Brewfile in this repository.

### Copy to root
This Brewfile can be copied to the user root directory (`~`) and sourced.

```shell
cp path/to/developer-configuration/macos/homebrew/Brewfile ~/Brewfile
brew bundle install
```

In this method, getting any updates from the Brewfile in the repository will have to be done manually.
This is generally a good path to follow when setting up machines for work/personal use, if you will start
building Brewfiles that are specific to the machine.

### Symlink to root
You can symlink the Brewfile in the user root directory to this Brewfile and souce it.

```shell
ln -s /absolute/path/to/developer-configuration/macos/homebrew/Brewfile ~/Brewfile
brew bundle install
```

This way, whenever changes are pushed to the Brewfile in this repository, they will automatically be added
to the Brewfile the machine is looking at.

### Direct install
You can also simply install the specific packages in the Brewfile.

```shell
brew bundle install --file=path/to/developer-configuration/macos/homebrew/Brewfile
```
