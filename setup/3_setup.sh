#!/bin/bash
# Bootstrap dotfiles repo and install base packages
set -e

source /etc/os-release

case "$ID" in
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
*)
	echo "This distribution is not set up"
	exit 1
	;;
esac

DOTFILES_DIR="$HOME/.dotfiles"

if [ -d "$DOTFILES_DIR/.git" ]; then
	git -C "$DOTFILES_DIR" pull --ff-only
elif [ -d "$DOTFILES_DIR" ]; then
	echo "Found $DOTFILES_DIR but it is not a Git repository."
	exit 1
else
	git clone https://github.com/juandrzej/dotfiles.git "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR/setup"
ansible-playbook install_packages.yml --ask-become-pass

echo "Dotfiles and base packages setup complete."
