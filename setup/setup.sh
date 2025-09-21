#!/bin/bash

source /etc/os-release
case $ID in
debian)
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y git ansible
	;;
fedora)
	sudo dnf update
	sudo dnf install -y git ansible
	;;
arch)
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm git ansible
	;;
*) echo "This distribution is not set up" ;;
esac
