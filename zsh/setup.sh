#!/bin/bash

# Make sure this file is executable

# Source .zshenv to set XDG_CONFIG_HOME environment variables
source zsh/.zshenv

# No .zshrc file will be at $HOME, so .zshenv file will be in the home directory
mv zsh/.zshenv $HOME

mv zsh $XDG_CONFIG_HOME
