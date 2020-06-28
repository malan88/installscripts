1. Add all these scripts, plus an ssh key with github authorization, to a flash
   drive so that all this can be copied from the flash drive/run.
2. `timedatectl set-ntp true`
3. Partition disks
    - If UEFI (verify via `ls /sys/firmware/efi/efivars/`), first partition of
      first of boot disk must be a 512M FAT EFI partition
    - One regular partition
    - Optional /home/ partition
    - Swap partition
4. Format disks
    - For EFI partition `mkfs.fat -F32 /dev/sda1`
    - For default partition `mkfs.ext4 /dev/sda2`
    - For swap partition `mkswap /dev/sda3` && `swapon /dev/sda3`
5. Mount the drives. Good idea to mount everything now for later genfstab.
6. Run `./install.sh`. You will be chrooted into the installation at the end so
   read the rest of this now.
7. Run `./chroot.sh`
8. Install grub. I don't have that automated yet.
9. Reboot
10. Login as user, run `./reboot.sh`
11. Final step: run either `server=true yadm bootstrap` or `gui=true yadm
    bootstrap`
