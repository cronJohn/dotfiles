#!/bin/bash

zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')

# A universal way of installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> $zshrc_location
