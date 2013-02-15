#!/bin/bash
#
# Simple script for copying config files to the system folders.
#
#


SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`


# copy dnsmasq config to /etc
read -p "Copy dnsmasq.conf to /etc [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  sudo cp -f $SCRIPTPATH/etc/dnsmasq.conf /etc
fi


# copy dnsmasq config to /etc
printf "\n"
read -p "Copy resolv.conf and NetworkManager deploy script [y/N]" -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]; then
  sudo cp -f $SCRIPTPATH/etc/resolv.conf /etc
  sudo cp -f $SCRIPTPATH/etc/resolv.conf.opendns /etc
  sudo cp -f $SCRIPTPATH/etc/NetworkManager/dispatcher.d/my.resolv.conf /etc/NetworkManager/dispatcher.d/
fi

printf "\n"
