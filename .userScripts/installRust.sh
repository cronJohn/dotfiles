#!/bin/bash

install_cmd="curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

./teep.sh https://www.rust-lang.org/learn/get-started "$install_cmd" > /dev/null

if [ $? -eq 0 ]; then
    eval $install_cmd
    echo 'source "$HOME/.cargo/env"' >> $zshrc_location
else
    echo "The command for installing Rust has probably changed"
fi
