#!/bin/bash

# Source .zshenv to set XDG_CONFIG_HOME environment variables
source .zshenv

# No .zshrc file will be at $HOME, so .zshenv file will be in the home directory
mv .zshenv $HOME

mv ../zsh $XDG_CONFIG_HOME
