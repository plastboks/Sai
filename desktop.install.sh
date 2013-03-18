#!/bin/bash
#
# This is an ugly and simple shortcut for installing various software
# 
# The script should be considered as a reference only.
# 



# update
read -p "Update repos before installing [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -Syu
fi


# setup aur
printf "\n"
read -p "Setup AUR and Yaurt [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
 sudo echo '[archlinuxfr]' >> /etc/pacman.conf
 sudo echo 'Server = http://repo.archlinux.fr/$arch'
 sudo pacman -Sy \
  yaourt
fi


# wifi 
printf "\n"
read -p "Install wireless tools and wicd [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    iw \
    wireless_tools 
fi


# network manager graphical tool
printf "\n"
read -p "Install grapical network manager tool [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    network-manager-applet
fi


# network manager vpn addons
printf "\n"
read -p "Install network manager applet VPN addons [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    networkmanager-openconnect \
    networkmanager-openvpn \
    networkmanager-pptp
fi


# dnsmasq
printf "\n"
read -p "Install dnsmasq dhcp/dns server [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    dnsmasq
fi


#dnsmasq enable and activate
printf "\n"
read -p "Enable and activate dnsmas server [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo systemctl enable dnsmasq.service
  sudo systemctl start dnsmasq.service
fi


# xserver and some other
printf "\n"
read -p "Install xorg [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    xorg-server \
    xorg-xinit \
    xorg-xrdb \
    xorg-xrandr \
    xautolock \
    xorg-utils \
    xorg-apps 
fi


# intel graphics driver
printf "\n"
read -p "Install intel graphics driver [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    xf86-video-intel
fi


# nvidia open source graphics driver
printf "\n"
read -p "Install nvidia open source graphics driver [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    xf86-video-nouveau
fi


# arandr monitor utiliy
printf "\n"
read -p "Install arandr graphics utility [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    arandr
fi


# slimDM login screen
printf "\n"
read -p "Install slim graphical login manager [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    slim
  sudo systemctl enable slim.service
fi


# i3 window manager and dmenu
printf "\n"
read -p "Install i3 window manager and dmenu [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    i3 \
    dmenu
    rxvt-unicode
fi


# fonts
printf "\n"
read -p "Install fonts [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    ttf-linux-libertine \
    ttf-freefont \
    ttf-liberation 
fi


# sound
printf "\n"
read -p "Install soundutils and player [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    alsa-utils \
    moc
fi


# video
printf "\n"
read -p "Install movieutils and player [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    mplayer
fi


# editors 
printf "\n"
read -p "Install editors [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    vim \
    ctags
fi


# network tools
printf "\n"
read -p "Install various network tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    wget \
    nfs-utils 
fi


# NFS server
printf "\n"
read -p "Install nfs client and server [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  print "\n"
  sudo pacman -S \
    nts-utils
fi


# activate NFS serivce
printf "\n"
read -p "Activate NFS server service" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  print "\n"
  sudo systemctl enable rpc-idmapd.service
  sudo systemctl enable rpc-mountd.service
  sudo systemctl start rpc-idmapd.service
  sudo systemctl start rpc-mountd.service
fi


# Nginx, php-fpm
printf "\n"
read -p "Install nginx and php-fpm [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    nginx \
    php-fpm
fi

# Activate nginx and php-fpm
printf "\n"
read -p "Activate and start Nginx and php-fpm [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  print "\n"
  sudo systemctl enable nginx.service
  sudo systemctl enable php-fpm.service
  sudo systemctl start nginx.service
  sudo systemctl start php-fpm.service
fi


# network time tools
printf "\n"
read -p "Install various networktime tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \ 
    ntp
fi


# enable ntpd
printf "\n"
read -p "Enable ntpd [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  read -p "Enter timezone (ex Europe/Oslo): " -r
  sudo timedatectl set-timezone $REPLY
  sudo systemctl enable ntpd
  sudo systemctl start ntpd
  sudo timedatectl set-ntp 1
fi


# bluetooth utilities
printf "\n"
read -p "Install bluetooth tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    bluez \
    blueman

fi


# enable and activate bluetooth daemon
printf "\n"
read -p "Activate and enable bluetooth daemon [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooht.service
fi


# sensors
printf "\n"
read -p "Install hardwaresensors utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \ 
    lm_sensors
fi


# ssh and rsync
printf "\n"
read -p "Install ssh, encryption and sync utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    openssh \
    sshfs \
    unison \
    rsync \
    keychain \
    ecryptfs-utils \
    encfs \
    openssl \
    zlib 
fi


# enable ssh server 
printf "\n"
read -p "Enable ssh server and start it [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo systemctl enable sshd.service
  sudo systemctl start sshd.service
fi


# mail, chat, rss
printf "\n"
read -p "Install mail, and rss utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    mutt \
    newsbeuter
fi


# IRC and Jabber
printf "\n"
read -p "Install irc and jabber tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    irssi \
    bitlbee
fi


# Bitlbee daemon
printf "\n"
read -p "Enable and start Bitlbee daemon [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  print "\n"
  sudo systemctl enable bitlbee.service
  sudo systemctl start bitlbee.service
fi


# web 
printf "\n"
read -p "Install webbrowsers [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    luakit \
    dwb \
    firefox
fi


# java browser plugin
printf "\n"
read -p "Install java browser plugin [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    icedtea-web
fi


# flash browser plugin
printf "\n"
read -p "Install flash browser plugin [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    flashplugin
fi


# smartcard 
printf "\n"
read -p "Install smartcard utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    pcsc-tools \
    ccid 
fi


# enable smartcard daemon
printf "\n"
read -p "Enable and start smardcard daemon [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo systemctl enable pcscd.service
  sudo systemctl start pcscd.service
fi


# disk utilities
printf "\n"
read -p "Install gptfdisk (cgdisk) [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  print "\n"
  sudo pacman -S \
    gptfdisk
fi



# file browsers and other tools
printf "\n"
read -p "Install graphical file browsers and other various graphics tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    pcmanfm \
    gksu \
    gamin \
    tangerine-icon-theme \
    gnome-menus \
    gvfs \
    gvfs-smb \
    gvfs-afp \
    gvfs-obexftp \
    gtk3 \
    librsvg \
    libpng \
    imagemagick \
    ghostscript \
    evince \
    sxiv
fi


# gigolo from AUR
printf "\n"
read -p "Install gigolo from AUR [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo yaourt -S \ 
    gigolo
fi


# thunar file browser
printf "\n"
read -p "Install thunar filebrowser and extra tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  sudo pacman -S \
    thunar \
    thunar-volume \
    thunar-archive-plugin \
    thunar-media-tags-plugin \
    file-roller
fi


# libreoffice
printf "\n"
read -p "Install libreoffice [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    libreoffice
fi


# notification
printf "\n"
read -p "Install notification tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    dunst \
    inotify-tools
fi


# archive tools
printf "\n"
read -p "Install archive tools [y/N]" -n 1 -r 
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    unrar \
    zip \
    p7zip \
    arj \
    unace
fi


# other
printf "\n"
read -p "Install other various cli tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    cclive \
    quvi \
    git \
    htop \
    tmux \
    links 
    socat
    findutils
fi

printf "\n"
