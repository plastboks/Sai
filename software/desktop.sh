# THIS FILE IS ONLY FOR REFERANCE!!!


# update
read -p "Update repos before installing [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -Syu
fi


# xserver and some other
printf "\n"
read -p "Install xorg and i3 [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    xorg-server \
    xorg-xinit \
    xorg-xrdb \
    xorg-xrandr \
    xf86-video-nouveau \
    xautolock \
    xorg-utils \
    xorg-apps \
    i3 \
    rxvt-unicode \
    dmenu 
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
    vim
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


# network time tools
printf "\n"
read -p "Install various networktime tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \ 
    ntp
  CRONDATE="/etc/cron.hourly/ntpdate"
  if [[ -f $CRONDATE ]]; then
    printf "${CRONDATE} already exists"
  else
    printf "Making ${CRONDATE} and population it with data."
    sudo touch $CRONDATE
    sudo chmod +x $CRONDATE
    printf "#!/bin/sh" > $CRONDATE
    printf "/usr/bin/ntpdate pool.ntp.org" >> $CRONDATE
  fi
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


# mail, chat, rss
printf "\n"
read -p "Install mail, chat and rss utils [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    mutt \
    finch \
    newsbeuter
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


# file browsers and other tools
printf "\n"
read -p "Install graphical file browsers and other various tools [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  printf "\n"
  sudo pacman -S \
    pcmanfm \
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
    evince 
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
    tmux 
fi

printf "\n"
