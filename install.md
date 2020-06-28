1. `timedatectl set-ntp true`
2. Partition disks
    - If UEFI (verify via `ls /sys/firmware/efi/efivars/`), first partition of
      first of boot disk must be a 512M FAT EFI partition
    - One regular partition
    - Optional /home/ partition
    - Swap partition
3. Format disks
    - For EFI partition `mkfs.fat -F32 /dev/sda1`
    - For default partition `mkfs.ext4 /dev/sda2`
    - For swap partition `mkswap /dev/sda3` && `swapon /dev/sda3`
4. Mount the drives. Good idea to mount everything now for later genfstab.
5. Run `./install.sh`. You will be chrooted into the installation at the end so
   read the rest of this now.
6. Run `./chroot.sh`
7. Install grub. I don't have that automated yet.
8. Reboot
9. Login as user, run `./reboot.sh`
10. Final step: run either `server=true yadm bootstrap` or `gui=true yadm
    bootstrap`
