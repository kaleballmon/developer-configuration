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
