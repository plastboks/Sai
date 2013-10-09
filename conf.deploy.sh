#!/bin/bash
#
# Simple script for copying config files to the system folders.
#
#


SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`


# copy dnsmasq config to /etc
printf "\n"
read -p "Deploy configs [y/N] " -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  sudo cp -f $SCRIPTPATH/conf/etc/resolv.conf /etc/
  sudo cp -f $SCRIPTPATH/conf/etc/resolv.conf.opendns /etc/
  sudo cp -f $SCRIPTPATH/conf/etc/resolv.conf.head /etc/
  sudo cp -f $SCRIPTPATH/conf/etc/NetworkManager/dispatcher.d/my.resolv.conf /etc/NetworkManager/dispatcher.d/

  sudo cp -f $SCRIPTPATH/conf/etc/openvpn/mullvad_linux.conf /etc/openvpn/
  sudo cp -f $SCRIPTPATH/conf/usr/share/openvpn/* /usr/share/openvpn/

  sudo cp -f $SCRIPTPATH/conf/etc/udev/rules.d/* /etc/udev/rules.d/
fi

printf "\n"
