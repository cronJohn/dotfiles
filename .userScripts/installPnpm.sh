#!/bin/bash

zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')
pnpm_location="$HOME/.local/share/pnpm"
node_version=latest # lts or latest

# A universal way of installing pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo 'export PNPM_HOME="$pnpm_location"' >> $zshrc_location
echo 'export PATH="$PNPM_HOME:$PATH"' >> $zshrc_location

$pnpm_location/pnpm env use --global $node_version
