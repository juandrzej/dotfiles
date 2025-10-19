#!/bin/bash

source /etc/os-release
case $ID in
debian)
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y git ansible
	;;
fedora)
	sudo dnf update -y
	sudo dnf install -y git ansible
	;;
arch)
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm git ansible
	;;
*) echo "This distribution is not set up" ;;
esac

git clone git@github.com:juandrzej/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/setup
ansible-playbook install_packages.yml --ask-become-pass
