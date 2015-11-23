#!/bin/bash
#
# This is an ugly and simple shortcut for installing various software
# 
# The script should be considered as a reference only.
# 


PAC=""


#############
# X related #
#############
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
        xdg-user-dirs"
fi

printf "\n" # intel graphics driver
read -p "Install intel graphics driver [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC xf86-video-intel mesa-vdpau"
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
        rofi \
        rxvt-unicode \
        xterm \
        gnome-themes-standard \
        gtk-engines \
        feh \
        archlinux-wallpaper \
        xcompmgr \
        bash-completion \
        autocutsel \
        urxvt-perls"
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
        adobe-source-code-pro-fonts \
        adobe-source-sans-pro-fonts \
        adobe-source-serif-pro-fonts \
        adobe-source-han-sans-jp-fonts \
        faenza-icon-theme"
fi

printf "\n" # arandr monitor utility
read -p "Install arandr graphics utility [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC arandr"
fi


###############
# MEDIA TOOLS #
###############
printf "\n" # sound
read -p "Install pulseaudio [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        alsa-utils \
        pulseaudio \
        pulseaudio-alsa \
        pavucontrol"
fi

printf "\n" # video and music
read -p "Install movie and audio player [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        mplayer \
        ncmpcpp \
        mpd \
        cmus"
fi

printf "\n" # video playback library
read -p "Install movie playback libraries (intel) [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        libva-intel-driver \
        libvdpau-va-gl"
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


############################
# NETWORKING  AND WIRELESS #
############################
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

printf "\n" # bluetooth utilities
read -p "Install bluetooth tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC bluez blueman"
fi


######################
# Editors and coding #
######################
printf "\n" # python and virtualenv
read -p "Install python2 and virtualenv [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC python2 python2-virtualenv"
fi

printf "\n" # editors
read -p "Install editors [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC vim ctags"
fi
printf "\n" # sensors
read -p "Install hardwaresensors utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC lm_sensors"
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


########################
# WEB, MAIL and SOCIAL #
########################
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

##########
# OFFICE #
##########
printf "\n" # libreoffice
read -p "Install libreoffice [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC libreoffice"
fi


############
# PRINTING #
############
printf "\n" #printing
read -p "Install CUPS printing software [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        cups \
        cups-filters \
        ghostscript \
        gsfonts"
fi

printf "\n" # notification
read -p "Install notification tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC dunst inotify-tools"
fi


###########
# VARIOUS #
###########
printf "\n" # various
read -p "Install other various cli tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC \
        cclive \
        livestreamer \
        quvi \
        git \
        htop \
        tmux \
        links \
        wget \
        nfs-utils \
        socat \
        findutils \
        enscript \
        unrar \
        zip \
        unzip \
        p7zip \
        gptfdisk \
        arj \
        unace"

fi

printf "\n" # smartcard
read -p "Install smartcard utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
    PAC="$PAC pcsc-tools ccid"

fi


###########
# Install #
###########
sudo pacman -Syu $PAC
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
