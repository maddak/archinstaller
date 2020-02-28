#!/bin/bash

pacman -Sy
pacman -S archlinux-keyring
pacman-key --init
pacman-key --populate archlinux

cryptsetup luksFormat --cipher aes-xts-plain64 --hash sha512 --key-size 512 --iter-time=5000 /dev/sda2
cryptsetup luksOpen /dev/sda2 encrypted

pvcreate /dev/mapper/encrypted
vgcreate encrypted /dev/mapper/encrypted
lvcreate -L 35GB -n root encrypted
lvcreate -l 100%FREE -n home encrypted

mkfs.ext4 /dev/mapper/encrypted-root
mkfs.ext4 /dev/mapper/encrypted-home

mkdir /installation
mount /dev/mapper/encrypted-root /installation

mkdir -v /installation/{boot,home}

mount /dev/sda1 /installation/boot
mount /dev/mapper/encrypted-home /installation/home

pacstrap /installation base base-devel vi

genfstab -U /installation >> /installation/etc/fstab

mkdir -v /installation/root/arch
cp -vr * /installation/root/arch

arch-chroot /installation

#mkswap /dev/mapper/encrypted-swap
#lvcreate -L 20GB -n swap encrypted
#swapon /dev/mapper/encrypted-swap
