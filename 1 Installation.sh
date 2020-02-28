#!/bin/bash

echo nikantech > /etc/hostname

ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
hwclock --systohc --utc

sed -i 's/#fa_IR UTF-8/fa_IR UTF-8/' /etc/locale.gen
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

vi /etc/pacman.d/mirrorlist
vi /etc/pacman.conf

pacman -Sy linux-headers linux-firmware grub-bios xf86-video-amdgpu xf86-video-intel xf86-video-ati mesa lib32-mesa libinput gnome gnome-extra gnome-tweak-tool chrome-gnome-shell arc-gtk-theme arc-icon-theme networkmanager network-manager-applet networkmanager-pptp networkmanager-openvpn ecryptfs-utils lsof dosfstools ntfs-3g gparted pacman-contrib zsh zsh-completions wget aria2 youtube-dl unzip unrar p7zip man tldr exa perl-rename htop tree mlocate whois asciinema screenfetch pydf progress lolcat cowsay tmux vim ufw fail2ban openssh vnstat tor privoxy torsocks wireguard-tools wireguard-arch resolvconf httpie httrack lynx rsync cpulimit hdparm smartmontools testdisk cups splix nmap usbutils macchanger tcpdump hping gnu-netcat wireshark-qt traceroute rkhunter remmina git composer yarn npm nodejs python-pip python-virtualenv docker apache php php-apache mariadb phpmyadmin php-gd php-dblib php-odbc php-pgsql php-sqlite hdf5 mysql-workbench sqlitebrowser jre8-openjdk jdk8-openjdk geany code atom arduino codeblocks arduino-avr-core arduino-docs adb openmp poedit octave opencv opencv-samples virtualbox virtualbox-guest-iso libreoffice-still-fa gimp inkscape blender obs-studio audacity openshot vlc mpv irssi firefox chromium imagemagick ffmpeg thunderbird transmission-gtk filezilla texlive-most texlive-langextra gummi ttf-dejavu ttf-droid zeal calibre gtk3 qt5 goldendict gaupol kodi goldendict texlive-latexextra texlive-core tidy
# os-prober capitaine-cursors python-beautifulsoup4 python-requests python-lxml python-eyed3 python-mysql-connector mysql-python python2-beautifulsoup4 python2-requests python-scipy python-numpy vsftpd cuda

useradd -m -g users -G wheel,lp,power,storage,video,audio,games,uucp,lock,wireshark,vboxusers -s /bin/zsh maddak
passwd maddak
passwd
visudo

vi /etc/crypttab
vi /etc/fstab
vi /etc/default/grub

vi /etc/mkinitcpio.conf
mkinitcpio -p linux

grub-install --target=i386-pc --debug --recheck --force /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

vi /etc/pam.d/system-auth

systemctl enable gdm
systemctl enable NetworkManager
systemctl enable ufw
systemctl enable fail2ban
systemctl enable sshd
systemctl enable docker
systemctl enable httpd
systemctl enable mariadb
systemctl enable cups-browsed
systemctl enable vnstat
systemctl enable tor
systemctl enable privoxy
