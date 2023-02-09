#!/bin/bash

installSSH() {
    ENCRYPTION_ALGORITHM=ed25519
    read -p "What is your email? (noreply email is recommended) " GIT_EMAIL

    ssh-keygen -t $ENCRYPTION_ALGORITHM -C $GIT_EMAIL

    eval "$(ssh-agent -s)"

    file=$(ls ~/.ssh/ -t | grep -v "\.pub$" | head -1) # Find the latest file that was created

    ssh-add ~/.ssh/$file

    echo "Here is the SSH public key you need to add to your Github account:"
    cat ~/.ssh/$file.pub
    xdg-open https://github.com/settings/keys

    read -n1 -r -p "Press any key to continue when you're done... "

    echo "Great! Testing connection..."
    sleep 2

    ssh -T git@github.com

    echo "Everything should be setup!"
}

if [ ! -d ~/.ssh ]; then
    echo "Need to install ssh"
    installSSH
else
    echo "SSH should already be installed..."
fi
