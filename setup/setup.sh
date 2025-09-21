#!/bin/bash

case $(cat /etc/os-release | grep '^ID=') in
*debian*) echo "debian" ;;
*fedora*) echo "fedora" ;;
*arch*) echo "arch" ;;
esac
