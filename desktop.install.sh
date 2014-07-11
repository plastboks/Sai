#!/bin/bash
#
# This is an ugly and simple shortcut for installing various software
# 
# The script should be considered as a reference only.
# 


PAC=""

printf "\n" # xserver and some other
read -p "Install xorg [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        xorg-server \
        xorg-xinit \
        xorg-xrdb \
        xorg-xrandr \
        xautolock \
        xorg-utils \
        xorg-apps \
        rxvt-unicode \
        xdg-user-dirs "
fi

printf "\n" # intel graphics driver
read -p "Install intel graphics driver [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC xf86-video-intel"
fi

printf "\n" # nvidia open source graphics driver
read -p "Install nvidia open source graphics driver [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC xf86-video-nouveau"
fi

printf "\n" # i3 window manager and dmenu
read -p "Install i3 window manager and dmenu [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        i3 \
        dmenu \
        xterm \
        rxvt-unicode"
fi

printf "\n" # fonts
read -p "Install fonts and icons themes [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        ttf-linux-libertine \
        ttf-freefont \
        ttf-liberation \
        ttf-dejavu \
        tangerine-icon-theme \
        faenza-icon-theme"
fi

printf "\n" # arandr monitor utility
read -p "Install arandr graphics utility [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC arandr"
fi

printf "\n" # sound
read -p "Install pulseaudio [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        alsa-utils \
        pulseaudio \
        pulseaudio-alsa \
        pavucontrol \
        cmus"
fi

printf "\n" # wifi
read -p "Install wireless tools and wicd [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC iw wireless_tools"
fi

printf "\n" # network manager graphical tool
read -p "Install grapical network manager tool [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC network-manager-applet"
fi

printf "\n" # network manager vpn addons
read -p "Install network manager applet VPN addons [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        networkmanager-openconnect \
        networkmanager-openvpn"
fi

printf "\n" # dnsmasq
read -p "Install dnsmasq dhcp/dns server [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC dnsmasq"
fi

printf "\n" # python and virtualenv
read -p "Install python2 and virtualenv [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC python2 python2-virtualenv"
fi

printf "\n" # video
read -p "Install movieutils and player [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC mplayer"
fi

 
printf "\n" # editors
read -p "Install editors [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC vim ctags"
fi

printf "\n" # network tools
read -p "Install various network tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC wget nfs-utils"
fi

printf "\n" # bluetooth utilities
read -p "Install bluetooth tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC bluez blueman"
fi

printf "\n" # sensors
read -p "Install hardwaresensors utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC lm_sensors"
fi

printf "\n" # ssh and rsync
read -p "Install ssh, encryption and sync utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        openssh \
        sshfs \
        unison \
        rsync \
        keychain \
        ecryptfs-utils \
        encfs \
        openssl \
        zlib"
fi

printf "\n" # mail, chat, rss
read -p "Install mail, and rss utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC mutt newsbeuter"
fi

printf "\n" # IRC and Jabber
read -p "Install irc and jabber tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC irssi bitlbee"
fi

printf "\n" # web
read -p "Install webbrowsers [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC dwb luakit firefox"
fi

printf "\n" # java browser plugin
read -p "Install java browser plugin [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC icedtea-web-java7"
fi

printf "\n" # flash browser plugin
read -p "Install flash browser plugin [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC flashplugin"
fi
 
printf "\n" # smartcard
read -p "Install smartcard utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC pcsc-tools ccid"

fi

printf "\n" # disk utilities
read -p "Install gptfdisk (cgdisk) [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC gptfdisk"
fi

printf "\n" # image tools
read -p "Install image libraries and viewers [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        librsvg \
        libpng \
        imagemagick \
        ghostscript \
        evince \
        sxiv"
fi

printf "\n" # file browsers and other tools
read -p "Install graphical file browsers [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        pcmanfm \
        gamin \
        gnome-menus \
        gvfs \
        gvfs-smb \
        gvfs-afp \
        gvfs-obexftp \
        gtk3"
fi

printf "\n" # thunar file browser
read -p "Install thunar filebrowser and extra tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        thunar \
        thunar-volume \
        thunar-archive-plugin \
        thunar-media-tags-plugin \
        file-roller"
fi

printf "\n" # libreoffice
read -p "Install libreoffice [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC libreoffice"
fi

printf "\n" #printing
read -p "Install CUPS printing software [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        cups \
        cups-filters \
        ghostscript \
        gsfonts"
fi

printf "\n" # hp printer driver
read -p "Install HP printer drivers [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC hplip"
fi

printf "\n" # notification
read -p "Install notification tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC dunst inotify-tools"
fi

printf "\n" # archive tools
read -p "Install archive tools [y/N]" -n 1 -r 
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        unrar \
        zip \
        unzip \
        p7zip \
        arj \
        unace"
fi

printf "\n" # avr programming
read -p "Install avr-gcc avrdude etc [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        avr-gcc \
        avr-binutils \
        avr-gdb \
        avr-libc \
        simavr \
        avrdude"
fi

printf "\n" # other
read -p "Install other various cli tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        cclive \
        quvi \
        git \
        htop \
        tmux \
        links \
        socat \
        findutils \
        enscript"
fi


printf "\n" # update
read -p "Update repos before installing [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    printf "\n"
    sudo pacman -Syu
fi

sudo pacman -S $PAC
printf "\n"
exit


# network time tools
printf "\n"
read -p "Install various networktime tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    printf "\n"
    sudo pacman -S \
        ntp

    # enable ntpd
    printf "\n"
    read -p "Enable and start ntpd [y/N]" -n 1 -r
    if [[ $REPLY =~ [Yy]$ ]]; then
        printf "\n"
        read -p "Enter timezone (ex Europe/Oslo): " -r
        sudo timedatectl set-timezone $REPLY
        sudo systemctl enable ntpd
        sudo systemctl start ntpd
        sudo timedatectl set-ntp 1
    fi
fi

# enable smartcard daemon
printf "\n"
read -p "Enable and start smardcard daemon [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    printf "\n"
    sudo systemctl enable pcscd.service
    sudo systemctl start pcscd.service
fi
