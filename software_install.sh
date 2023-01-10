#!/bin/bash

# Exit if any error happens
set -e

source "./utils.sh"

standard_programs="$(lts neovim) zsh python3-neovim kate steam discord inkscape qalculate-qt ripgrep fzf"

flatpak_programs="net.ankiweb.Anki com.obsproject.Studio"

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

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
