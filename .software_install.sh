#!/bin/bash

# Exit if any error happens
set -e

# Install needed dependencies
sudo pacman -S --needed base-devel

# Install flatpak
echo 'Installing flatpak...'
sudo pacman -S flatpak

# Get colored emojis
sudo pacman -S noto-fonts-emoji
fc-cache -f -v

# Apply those emojis globally with this package
sudo pamac install noto-color-emoji-fontconfig

# Install Rust-lang
echo 'Installing rust-lang...'
sudo pamac install rustup
rustup install stable

# Install paru
echo 'Installing paru...'
cd $HOME
sudo pamac install paru-bin

# Install drivers to make Davinci Resolve work
echo 'Installing drivers for Davinci Resolve...'
paru -S amdgpu-pro-libgl opencl-amd

# Install kden live
sudo pacman kdenlive

# Install Node (or pnpm)
echo 'Installing pnpm...'
sudo pamac install pnpm-bin
# By default this doesn't work with zsh
# You need to add...
  # export PNPM_HOME="$HOME/.local/share/pnpm"
  # export PATH="$PNPM_HOME:$PATH"
# To your .zshrc

# ! Will probably mention this in the pnpm git repo or
# ! create a script that does this automatically


# I usually just do pnpm env use --global latest but you can uncomment this and choose

# Install the version of node the user wants
# while true; do
# 	read -p 'Do you want to install the LTS(1) or Latest(2)? (Default=2) ' choice
# 	case $choice in
# 		1) pnpm env use --global lts
# 		   break
# 		;;
		
# 		2) pnpm env use --global latest
# 		   break
# 		;;
		
# 		"") pnpm env use --global latest
# 		    break
# 		;;
		
# 		*) echo 'Please pick option LTS(1) or Latest(2)...'
# 		;;
# 	esac
# done


# Start installing Steam
echo 'Uncomment the [multilib] (can uncomment the Color in Misc options)'
sudo nano /etc/pacman.conf
sudo pacman -Syy # Refresh package db
echo 'Install mesa drivers for AMD'
sudo pacman -S lib32-mesa # Install drivers for AMD

echo 'Uncomment the en_US.UTF-8 UTF-8'
sudo nano /etc/locale.gen
sudo locale-gen

echo 'Installing Microsoft fonts...'
sudo pamac install ttf-ms-fonts

echo 'Installing wqy-zenhei to add support for Asian languages...'
sudo pacman -S wqy-zenhei

echo 'Installing steam...'
sudo pacman -S steam
echo 'All set installing Steam! Make sure to enable Steam Proton!'

# Install Anki
echo 'Installing Anki...'
sudo pamac install anki-bin

# Install Discord
echo 'Installing Discord...'
sudo pamac install discord

echo 'Installing JetBrains font...'
sudo pamac install nerd-fonts-jetbrains-mono

# Install OBS-Studio

# export QT_QPA_PLATFORM=wayland # Need this setting for pipewire if you use wayland

echo 'Installing OBS Studio...'
flatpak install flathub com.obsproject.Studio

echo 'It is recommended to restart now after installation'
echo 'Check to see if it is working...'
flatpak run com.obsproject.Studio


# Install Obsidian
echo 'Installing Obsidian...'
sudo pamac install obsidian

# Install Inkscape
sudo pamac install inkscape

# Install Qalculate!
sudo pamac install qalculate-qt

## Remove kcalc if already installed
## sudo pacman -Rns kcalc

# Install Razer drivers
## Need kernel headers before installing
sudo pamac install linux515-headers # Change 515 to whatever kernel version you are using

## Then install the main openrazer package
paru openrazer-meta

# Install neovim
sudo pamac install neovim

## Install dependencies if you use something like lunarvim
pacman -S ripgrep
pacman -S fd

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
