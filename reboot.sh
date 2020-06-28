#!/bin/bash

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm --needed
cd

echo "Installing yadm"
git clone https://aur.archlinux.org/yadm-git.git
cd yadm-git
makepkg -si --noconfirm --needed
cd

echo "cloning ssh key"
mkdir .ssh
sudo cp /mnt/id_rsa* .ssh/

echo "cloning yadm"
yadm clone git@github.com:malan88/dotfiles
