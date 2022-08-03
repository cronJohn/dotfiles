#!/bin/bash

# Exit if any error happens
set -e

# Install git
echo 'Installing git...'
sudo pacman -S git

# Install flatpak
echo 'Installing flatpak...'
sudo pacman -S flatpak

# Fix emojis
sudo pacman -S noto-fonts-emoji
fc-cache -f -v

# Install Rust-lang
echo 'Installing rust-lang...'
sudo pamac install rustup
rustup install stable

# Install paru
echo 'Installing paru...'
cd $HOME
sudo pacman -S --needed base-devel # install necessary packages
sudo pamac install paru-bin

# Install drivers to make Davinci Resolve work
echo 'Installing drivers for Davinci Resolve...'
paru -S amdgpu-pro-libgl opencl-amd

# Install davinci resolve
paru davinci-resolve
echo 'Check to see if it works...'
progl /opt/resolve/bin/resolve
cd /usr/share/applications
echo 'Add progl after the "Exec="'
sudo nano com.blackmagicdesign.resolve.desktop

# Install Node (or pnpm)
echo 'Installing pnpm...'
sudo pamac install pnpm-bin

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
URL='https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip'
FILENAME='JetBrainsMono-2.242.zip'

python -m webbrowser $URL # Opens URL in browser tab to be downloaded

echo 'Waiting for Font to be downloaded...'
while ! test -f "/$HOME/$USER/Downloads/$FILENAME"; do
  sleep 3
  echo "Still waiting..."
done

echo 'Unzipping font to /usr/share/fonts'
sudo unzip $FILENAME -d /usr/share/fonts
echo 'The font should be installed!'


# Install OBS-Studio
export QT_QPA_PLATFORM=wayland # Need this setting for pipewire

echo 'Installing OBS Studio...'
flatpak install flathub com.obsproject.Studio

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
paru openrazer-meta

# Install Doom emacs

 ## Install dependencies
 pacman -S ripgrep
 pacman -S fd

sudo pamac install emacs-nativecomp

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
