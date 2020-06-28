#!/bin/bash
set -o errexit

echo "Updating mirrorlist..."
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

echo "Installing system with pacstrap..."
pacstrap /mnt base base-devel linux linux-firmware neovim vim vi dhcpcd man-db \
    man-pages texinfo git openssh

echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab

echo "arch-chrooting..."
arch-chroot /mnt
