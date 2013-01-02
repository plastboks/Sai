# THIS FILE IS ONLY FOR REFERANCE!!!


# update
read -p "Update repos before installing ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -Syu
fi


# xserver and some other
read -p "Install xorg and i3 ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
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
    dmenu \
fi


# fonts
read -p "Install fonts ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  ttf-linux-libertine \
  ttf-freefont \
  ttf-liberation 
fi


# sound
read -p "Install soundutils and player ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  alsa-utils \
  moc
fi


# video
read -p "Install movieutils and player ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  mplayer
fi


# editors 
read -p "Install editors ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    vim
fi


# network tools
read -p "Install various network tools ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    wget \
    nfs-utils \
fi


# network time tools
read -p "Install various network tools ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \ 
    ntp
  CRONDATE="/etc/cron.hourly/ntpdate"
  if [[ -f $CRONDATE ]]; then
    echo "${CRONDATE} already exists"
  else
    echo "Making ${CRONDATE} and population it with data."
    sudo touch $CRONDATE
    sudo chmod +x $CRONDATE
    echo "#!/bin/sh" > $CRONDATE
    echo "/usr/bin/ntpdate pool.ntp.org" >> $CRONDATE
  fi
fi


# sensors
read -p "Install hardwaresensors utils ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \ 
  lm_sensors
fi


# ssh and rsync
read -p "Install ssh, encryption and sync utils ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  openssh \
  sshfs \
  unison \
  rsync \
  keychain \
  ecryptfs-utils \
  encfs \
  openssl \
  zlib \
fi


# mail, chat, rss
read -p "Install mail, chat and rss utils ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  mutt \
  finch \
  newsbeuter
fi


# web 
read -p "Install webbrowsers ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  luakit \
  dwb \
  firefox
fi


# java browser plugin
read -p "Install java browser plugin ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    icedtea-web
fi

# flash browser plugin
read -p "Install flash browser plugin ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    flashplugin
fi

# smartcard 
read -p "Install smartcard utils ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
sudo pacman -S \
  pcsc-tools \
  ccid 
fi


# file browsers and other tools
read -p "Install graphical file browsers and other various tools ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
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
    libsvg \
    imagemagick \
    ghostscript \
    evince 
fi


# libreoffice
read -p "Install libreoffice ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    libreoffice
fi


# notification
read -p "Install notification tools ? " -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    dunst \
    inotify-tools
fi

# other
read -p "Install other various cli tools ?" -n 1 -r
if [[ $REPLY =~[Yy]$ ]]; then
  sudo pacman -S \
    cclive \
    quvi \
    git \
    htop \
    tmux \
fi
