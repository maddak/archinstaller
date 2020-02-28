#!/bin/bash

ufw enable
ufw allow 80
ufw allow 22

modprobe vboxdrv
modprobe ecryptfs

ecryptfs-migrate-home -u maddak

rm -rf /var/cache/pacman/pkg/*
