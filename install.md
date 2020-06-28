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
5. Everything from here on out is in install.sh -> chroot.sh then reboot then
   reboot.sh then yadm bootstrap
