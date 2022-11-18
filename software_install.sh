#!/bin/bash

# Exit if any error happens
set -e

standard_programs=( neovim python3-neovim kate steam discord inkscape qalculate-qt
                    ripgrep fd)

flatpak_programs=( net.ankiweb.Anki com.obsproject.Studio )

if ! command -v flatpak &> /dev/null
then
    echo "Flatpak not found! Installing"
    standard_programs+=(flatpak)
fi

# Install all standard programs
for i in "${standard_programs[@]}"
do
    # How it's installed is different depending on Arch (pacman) or Fedora (dnf)
done

# Install all flatpaks
for i in "${flatpak_programs[@]}"
do
    flatpak install flathub $i
done

# A universal way of installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# A universal way of installing pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# By default this doesn't work with zsh the way I have it configured
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

# Not sure if you still need this for OBS
# export QT_QPA_PLATFORM=wayland # Need this setting for pipewire if you use wayland

# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
