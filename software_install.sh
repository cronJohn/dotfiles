#!/bin/bash

# Exit if any error happens
set -e

source "./utils.sh"

standard_programs="$(lts neovim) zsh python3-neovim kate steam discord inkscape qalculate-qt ripgrep fzf"

flatpak_programs="net.ankiweb.Anki com.obsproject.Studio"

node_version=latest # lts or latest

# Functions for user to use and change
install_all(){
    install_programs $standard_programs
    install_flatpaks $flatpak_programs
}

run_dotfile_setups() {
    # Paths in setup.sh are relative to dotfiles (./ is /dotfiles/)
    configure_dotfile_dirs
    run_scripts_in_dir ".userScripts"
}


# Main script execution
output_status "Installing everything... " && install_all
output_status "Installing font... " 2 && install_font
output_status "Setting up dotfiles..." && run_dotfile_setups

zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')

# A universal way of installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> $zshrc_location


# A universal way of installing pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo 'export PNPM_HOME="$HOME/.local/share/pnpm"' >> $zshrc_location
echo 'export PATH="$PNPM_HOME:$PATH"' >> $zshrc_location

source ~/.bashrc
pnpm env use --global $node_version

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
