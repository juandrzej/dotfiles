#!/bin/bash

source /etc/os-release
case $ID in
debian) echo "debian" ;;
fedora) echo "fedora" ;;
arch) echo "arch" ;;
*) echo "This distribution is not setup" ;;
esac
