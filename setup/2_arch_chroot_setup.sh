#!/bin/bash
set -e # exit on any error

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
# enable sudo for wheel group
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >/etc/sudoers.d/wheel
chmod 440 /etc/sudoers.d/wheel
systemctl enable NetworkManager

# bootloader
bootctl install

# create boot entry
cat >/boot/loader/entries/arch.conf <<EOF
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=UUID=$(blkid -s UUID -o value /dev/nvme0n1p3) rootflags=subvol=@ rw resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2)
EOF

# create fallback boot entry
cat >/boot/loader/entries/arch-fallback.conf <<EOF
title   Arch Linux (fallback)
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux-fallback.img
options root=UUID=$(blkid -s UUID -o value /dev/nvme0n1p3) rootflags=subvol=@ rw resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2)
EOF

# loader configuration
cat >/boot/loader/loader.conf <<EOF
default arch.conf
timeout 2
console-mode max
editor  no
EOF

# add resume hook to mkinitcpio.conf (only if not already present)
sed -i '/^HOOKS=/{ /resume/! s/filesystems/filesystems resume/ }' /etc/mkinitcpio.conf

# regenerate initramfs
mkinitcpio -P
