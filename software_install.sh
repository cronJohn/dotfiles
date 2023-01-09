#!/bin/bash

# Exit if any error happens
set -e

source "./utils.sh"

standard_programs=( $(lts neovim) zsh python3-neovim kate steam discord inkscape qalculate-qt ripgrep fzf)

flatpak_programs=( net.ankiweb.Anki com.obsproject.Studio )

linux_distros=( ubuntu arch fedora nobara )

node_version=latest # lts or latest

zshrc_location=$(find $HOME -name ".zshrc" -not -path '*/*dotfiles/*')

installation_method=$(get_installation_method)

# Main script execution
run_dotfile_setups
install_programs
install_font

# A universal way of installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> zshrc_location


# A universal way of installing pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo 'export PNPM_HOME="$HOME/.local/share/pnpm"' >> zshrc_location
echo 'export PATH="$PNPM_HOME:$PATH"' >> zshrc_location

pnpm env use --global $node_version

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
