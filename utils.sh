#/bin/bash

linux_distros=( ubuntu arch fedora nobara )

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
    standard_programs=$1
    flatpak_programs=$2
    installation_method=$(get_installation_method)

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

run_dotfile_setups() {
    for dir in */;
    do
        $dir/setup.sh
    done
}
