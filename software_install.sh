#!/bin/bash

# Exit if any error happens
set -e

standard_programs=( neovim python3-neovim kate steam discord inkscape qalculate-qt
                    ripgrep fzf)

flatpak_programs=( net.ankiweb.Anki com.obsproject.Studio )

linux_distros=( ubuntu arch fedora )

node_version=latest # lts or latest


get_linux_distro() {
    location="/etc/os-release"
    for distro in "${linux_distros[@]}"
    do
        if grep -q $distro $location # finds something
        then
            echo "$distro"
        fi
    done
}

get_installation_method() {
    user_distro=$(get_linux_distro)
    command="sudo "

    if [ $user_distro = "fedora" ];
    then
        command+="dnf install"
    elif [ $user_distro = "arch" ];
    then
        command+="pacman -S"
    elif [ $user_distro = "ubuntu" ];
    then
        command+="apt install"
    else
        echo "User distro unknown"
    fi
    echo $command
}

installation_method=$(get_installation_method)

install_programs(){
    # Install all standard programs
    for i in "${standard_programs[@]}"
    do
        eval "$installation_method $i"
    done

    # Install all flatpaks
    for i in "${flatpak_programs[@]}"
    do
        flatpak install flathub $i
    done
}


install_font() {
    git clone https://github.com/ronniedroid/getnf.git
    cd getnf
    ./install.sh
    getnf
    cd ..
    rm -rf getnf
}


# Main script execution
install_programs
install_font

# A universal way of installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# A universal way of installing pnpm
# curl -fsSL https://get.pnpm.io/install.sh | sh -
## By default this doesn't work with zsh the way I have it configured

# You need to add...
  # export PNPM_HOME="$HOME/.local/share/pnpm"
  # export PATH="$PNPM_HOME:$PATH"
# To your .zshrc

# TODO Will probably mention this in the pnpm git repo or
# create a script that does this automatically

# eval "pnpm env use --global $node_version"


# Enable fs trim
echo 'Enabling SSD trim...'
sudo systemctl start fstrim.timer

echo 'All done!'

set +e
