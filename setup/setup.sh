#!/bin/bash

source /etc/os-release
case $ID in
debian)
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y git ansible
	;;
fedora) echo "fedora" ;;
arch) echo "arch" ;;
*) echo "This distribution is not set up" ;;
esac
