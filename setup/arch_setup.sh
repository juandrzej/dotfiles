#!/bin/bash
set -e # exit on any error

timedatectl

# disc partitioning
sgdisk -o /dev/nvme0n1                   # clear current setup
sgdisk -n 1:0:+1G -t 1:EF00 /dev/nvme0n1 # EFI
sgdisk -n 2:0:+4G -t 2:8200 /dev/nvme0n1 # swap
sgdisk -n 3:0:0 -t 3:8300 /dev/nvme0n1   # root

# disc formatting
mkfs.btrfs /dev/nvme0n1p3
mkswap /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1

# create btrfs subvolumes
mount /dev/nvme0n1p3 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
umount /mnt

# mount subvolumes with options
mount -o noatime,compress=zstd,subvol=@ /dev/nvme0n1p3 /mnt
mount -o noatime,compress=zstd,subvol=@home --mkdir /dev/nvme0n1p3 /mnt/home
mount -o noatime,compress=zstd,subvol=@snapshots --mkdir /dev/nvme0n1p3 /mnt/.snapshots
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2

# select mirrors
reflector --country PL,DE --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# install essential packs
pacstrap -K /mnt base linux linux-firmware amd-ucode base-devel vi vim networkmanager terminus-font man-db man-pages btrfs-progs

# configure filesystem
genfstab -U /mnt >>/mnt/etc/fstab

# dl separate chroot steps script, make it executable and run it inside chroot
curl -sSL https://raw.githubusercontent.com/juandrzej/dotfiles/main/setup/arch_chroot_setup.sh -o /mnt/tmp/chroot_setup.sh
chmod +x /mnt/tmp/chroot_setup.sh
arch-chroot /mnt /tmp/chroot_setup.sh

# finish
umount -R /mnt
reboot
