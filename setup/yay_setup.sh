#!/bin/bash

sudo pacman -Syu
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..
rm -rf yay/

yay -Y --devel --save
yay -S mkinitcpio-firmware
yay -S swayfx
