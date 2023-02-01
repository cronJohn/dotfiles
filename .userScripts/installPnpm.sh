#!/bin/bash

zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')
node_version=latest # lts or latest

# A universal way of installing pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo 'export PNPM_HOME=~/.local/share/pnpm' >> $zshrc_location
echo 'export PATH="$PNPM_HOME:$PATH"' >> $zshrc_location

source ~/.bashrc
pnpm env use --global $node_version
