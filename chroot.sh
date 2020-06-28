#!/bin/bash
if [[ -z "$hostname" ]]
then
    echo "Need hostname=<hostname> before execution"
    exit 27
fi

if [[ -z "$user" ]]
then
    echo "Need user=<user>"
    exit 28
fi

echo "generating datetime stuff and locale..."
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf

echo "generating hostname stuff..."
echo "$hostname" >> /etc/hostname
echo '127.0.0.1     localhost' >> /etc/hosts
echo '::1           localhost' >> /etc/hosts
echo "127.0.1.1     $hostname.localdomain   $hostname" >> /etc/hosts

echo "Need a password for root..."
passwd

echo "make my user..."
groupadd sudo
useradd -m -G sudo $user
passwd $user

echo "Enabling sudo..."
echo '%sudo   ALL=(ALL) ALL' >> /etc/sudoers

echo "Enabling dhcpcd..."
systemctl enable dhcpcd

# Need to coordinate grub/refind installation for EFI/MBR with a variable for
# the switch

echo "DONE DONE DONE"
echo "DON'T FORGET TO INSTALL GRUB"
