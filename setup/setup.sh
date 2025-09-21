#!/bin/bash

case $(cat /etc/os-release | grep '^ID=')
	*debian*) echo "debian";;
	*fedora*) echo "fedora";;
	*arch*) echo "arch";;
esac
