#!/bin/bash

# Make sure this file is executable

# Source .zprofile to set XDG_CONFIG_HOME environment variables
source zsh/.zprofile

# No .zshrc file will be at $HOME, so .zprofile file will be in the home directory
mv zsh/.zprofile $HOME

mv zsh $XDG_CONFIG_HOME
