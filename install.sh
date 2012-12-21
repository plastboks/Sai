#!/bin/bash

# My Little Arch Linux Installer
#
# Copyright (c) 2012 Anders Nor Berle <anders@berle.cc>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

ROOTFS="ext4"
ROOTFS_OPTIONS="rw,relatime,noatime,data=ordered"
ROOTFS_SSD_OPTIONS="discard"
HOSTNAME="arch"
BOOT_DEVICE="/dev/disk/by-partlabel/boot"
ROOT_DEVICE="/dev/disk/by-partlabel/root"
HOOKS=""

while test $# -gt 0; do
  OPTION=$1
  shift

  case "$OPTION" in
    --btrfs)
      ROOTFS="btrfs"
      ROOTFS_OPTIONS="defaults,noatime"
      ROOTFS_SSD_OPTIONS="discard,ssd"
      ;;
    --luks)
      USE_LUKS=1
      ;;
    --lvm)
      USE_LVM=1
      ;;
    --hostname=*)
      HOSTNAME=`echo "$OPTION" | sed 's/--hostname=//'`
      ;;
    --nfs=*)
      NFS_CACHE=`echo "$OPTION" | sed 's/--nfs=//'`
      ;;
    --ssd)
      USE_SSD=1
      ;;
    -*)
      echo "Unrecognized option $OPTION"
      exit
      ;;
    *)
      DEVICE=$OPTION
      ;;
  esac
done

if [ "x$DEVICE" = "x" ]; then
  echo "Usage: $0 <options> <device>"
  cat<<"EOF"

My Little Arch Linux Installer
  Written by Anders Nor Berle <anders@berle.cc>

  --btrfs                  Use BTRFS as root filesystem (Default ext4)
  --hostname=<hostname>    Set the target hostname (Default "arch")
  --luks                   Enable LUKS encryption (Default off)
  --lvm                    Enable LVM (Default off)
  --nfs=<remote>           Mount an NFS directory as pacman package cache
  --ssd                    Optimize for SSD devices

EOF
  exit
fi

if [ "x$USE_SSD" != "x" ]; then
  ROOTFS_OPTIONS="$ROOTFS_OPTIONS,$ROOTFS_SSD_OPTIONS"
fi

# -- Unmount any previous attempt

umount /mnt/var/cache/pacman/pkg
umount /mnt/boot
umount /mnt
vgremove -f arch
cryptsetup luksClose $ROOT_DEVICE

# -- Partitioning

sgdisk \
  -o \
  -n 1:0:+32M -t 1:ef02 -c 1:bios \
  -n 2:0:+512M -c 2:boot \
  -N=3 -c 3:root \
  -p $DEVICE

sleep 2 # Needed to make partitions visible

# -- LUKS

if [ "x$USE_LUKS" != "x" ]; then
  HOOKS="$HOOKS encrypt"
  LUKS_DEVICE=$ROOT_DEVICE
  ROOT_DEVICE="/dev/mapper/crypt"

  cryptsetup \
    --cipher aes-xts-plain64 \
    --key-size 512 \
    --hash sha512 \
    --iter-time 5000 \
    --verify-passphrase \
    luksFormat $LUKS_DEVICE

  cryptsetup \
    luksOpen $LUKS_DEVICE crypt
fi

# -- LVM

if [ "x$USE_LVM" != "x" ]; then
  HOOKS="$HOOKS lvm2"
  LVM_DEVICE=$ROOT_DEVICE
  ROOT_DEVICE="/dev/mapper/arch-root"

  pvcreate $LVM_DEVICE
  vgcreate arch $LVM_DEVICE
  lvcreate --name root --extents 100%FREE arch
fi

# -- Filesystems

mkfs.ext2 $BOOT_DEVICE
mkfs.$ROOTFS $ROOT_DEVICE

# -- Mount

mount $ROOT_DEVICE /mnt
mkdir /mnt/boot
mount $BOOT_DEVICE /mnt/boot

if [ "x$NFS_CACHE" != "x" ]; then
  mkdir -p /mnt/var/cache/pacman/pkg
  mount -o nolock $NFS_CACHE /mnt/var/cache/pacman/pkg
fi

# -- Initialize base system

pacstrap /mnt base base-devel btrfs-progs grub-bios ifplugd sudo

# -- /etc

echo $ROOT_DEVICE / $ROOTFS $ROOTFS_OPTIONS 0 1 >> /mnt/etc/fstab
echo $BOOT_DEVICE /boot ext2 rw,relatime,noatime 0 2 >> /mnt/etc/fstab

perl -pi -e 's/(issue_discards) = 0/$1 = 1/' /etc/lvm/lvm.conf

echo en_US.UTF-8 UTF-8 > /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo LANG=en_US.UTF-8 > /mnt/etc/locale.conf

ln -s /usr/share/zoneinfo/Europe/Oslo /mnt/etc/localtime
hwclock --systohc --utc

echo $HOSTNAME > /mnt/etc/hostname

ln -s examples/ethernet-dhcp /mnt/etc/network.d
arch-chroot /mnt systemctl enable net-auto-wired.service

# -- Initramfs

perl -pi -e 's/^(HOOKS)/#$1/' /mnt/etc/mkinitcpio.conf
echo HOOKS=\"base udev autodetect modconf block$HOOKS filesystems usbinput fsck\" >> /mnt/etc/mkinitcpio.conf
arch-chroot /mnt mkinitcpio -p linux

# -- User setup

arch-chroot /mnt adduser
arch-chroot /mnt passwd -l root
echo "%wheel ALL=(ALL) ALL" > /mnt/etc/sudoers.d/wheel

# -- GRUB

arch-chroot /mnt grub-install --target=i386-pc --recheck $DEVICE
cp /mnt/usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /mnt/boot/grub/locale/en.mo

if [ "x$USE_LUKS" != "x" ]; then
  perl -pi -e 's/^(GRUB_CMDLINE_LINUX|GRUB_DISABLE_LINUX_UUID)/#$1/' /mnt/etc/default/grub
  echo GRUB_CMDLINE_LINUX=\"cryptdevice=$LUKS_DEVICE:crypt:allow-discards\" >> /mnt/etc/default/grub
  echo GRUB_DISABLE_LINUX_UUID=true >> /mnt/etc/default/grub
fi

arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

