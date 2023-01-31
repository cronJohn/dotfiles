#/bin/bash

linux_distros=( ubuntu arch fedora nobara )

output_status () {
    echo $1
    sleep ${2:-1}
}

get_linux_distro() {
    distro_info=$(grep "PRETTY_NAME" /etc/os-release)
    shopt -s nocasematch # if statement will be case insensitive

    for distro in "${linux_distros[@]}"
    do
        if [[ $distro_info =~ "$distro" ]];
        then
            echo "$distro"
        fi
    done

    shopt -u nocasematch
}

lts() {
    Repo="${2:-updates}" # Default repo is updates
    echo $1-$(get_latest_package_version $1 $Repo)
}

get_latest_package_version() {
    Package=$1
    Repo=$2
    PackageInfo=$(dnf list --showduplicates $Package | grep -e "$Repo")
    temp_array=($(echo $PackageInfo | tr " " "\n")) # Split by space
    echo ${temp_array[1]}
}

get_installation_method() {
    user_distro=$(get_linux_distro)
    command="sudo "

    if [ $user_distro = "fedora" ] || [ $user_distro = "nobara" ];
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


install_programs(){
    for i in "$*"; do $(get_installation_method) $i; done;
}

install_flatpaks(){
    for i in "$*"; do flatpak install flathub $i; done;
}

install_snap(){
    for i in "$*"; do sudo snap install $i; done;
}


install_font() {
    git clone https://github.com/ronniedroid/getnf.git
    cd getnf
    ./install.sh
    getnf
    cd ..
    rm -rf getnf
}

configure_dotfile_dirs(){ # ignores hidden directories
    if [[ $(find -maxdepth 1 -mindepth 1 -type d -not -name '.*' | wc -l) -gt 0 ]];
    then
        for dir in */; do $dir/${1:-setup.sh}; done
    fi
}

run_scripts_in_dir(){
    for dir in $(find "${1:-.userScripts}" -type f -print); do $dir; done
}
