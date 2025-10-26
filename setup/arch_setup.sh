#!/bin/bash

timedatectl

# disc partitioning
gdisk /dev/nvme0n1

# disc formatting
mkfs.fat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
mkfs.btrfs /dev/nvme0n1p3
mkfs.btrfs /dev/nvme0n1p4

# mounting
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2
mount /dev/nvme0n1p3 /mnt
mount /dev/nvme0n1p4 /mnt/home

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
systemctl enable NetworkManager

# bootloader
pacman -S man-db man-pages

exit
umount -R /mnt
reboot
