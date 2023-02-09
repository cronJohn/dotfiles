#!/bin/bash

node_version=latest # lts or latest
install_cmd='curl -fsSL https://get.pnpm.io/install.sh | sh -'

./teep.sh https://pnpm.io/installation "$install_cmd" > /dev/null

if [ $? -eq 0 ]; then
    zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')
    eval $install_cmd
    echo 'export PNPM_HOME=~/.local/share/pnpm' >> $zshrc_location
    echo 'export PATH="$PNPM_HOME:$PATH"' >> $zshrc_location

    source ~/.bashrc
    pnpm env use --global $node_version
else
    echo "The command for installing pnpm has probably changed"
fi
