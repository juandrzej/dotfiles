#!/bin/bash

timedatectl

# disc partitioning
gdisk /dev/nvme0n1

# disc formatting
mkfs.btrfs /dev/nvme0n1p3
mkswap /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1

# mounting
mount /dev/nvme0n1p3 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2

# select mirrors
reflector --country PL,DE --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# install essential packs
pacstrap -K /mnt base linux linux-firmware base-devel vi vim networkmanager terminus-font

# configure filesystem
genfstab -U /mnt >>/mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >/etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >/etc/locale.conf
cat >/etc/vconsole.conf <<EOF
KEYMAP=us
FONT=ter-v16b
EOF
echo "juandrzej-arch" >/etc/hostname

# adding pw for root and user
passwd
useradd -m -G wheel,users juandrzej
passwd juandrzej
visudo
systemctl enable NetworkManager

# bootloader
pacman -S man-db man-pages
bootctl install

# create boot entry
cat >/boot/loader/entries/arch.conf <<EOF
title   Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=UUID=$(blkid -s UUID -o value /dev/nvme0n1p3) rootflags=subvol=@ rw
EOF

# loader configuration
cat >/boot/loader/loader.conf <<EOF
default arch.conf
timeout 2
console-mode max
editor  no
EOF

# finish
exit
umount -R /mnt
reboot
