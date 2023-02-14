FROM fedora:latest

WORKDIR /dotfiles

COPY . .

RUN sudo dnf update -y

RUN sudo dnf install -y git flatpak

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
