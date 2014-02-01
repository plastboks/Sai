S.A.I
=====
Simple Arch Installer. Needs a better name...


Purpose
=======
This is just some super simple bash scripts for making the install process of Arch Linux a little simpler.


Usage
=====
  * `sh base.install.sh`: The main installer for use within the Arch Linux install environment.
  * `sh desktop.install.sh`: This is the package script for use after successfully installed and booted Arch Linux.
  * `sh conf.deploy.sh`: Use for copying the files in the `conf` dir to the system. 


Syslinux conversion
===================
This script now uses syslinux as bootloader instead of the previous Grub2 bootloader. This because I think the Grub2 bootloader misbehaves on newer systems and is more troublesome to setup.
The Syslinux bootloader offers a variety of options. The standards options (as used in this script) is in my opinion more than satisfying. One thing worth mentioning though is the addition of the `vga` flag on the APPEND line in `/boot/syslinux/syslinux.cfg`. The use of the vga flag on this line will define the screen resolution on the first part of the boot process. 
  * `vga=773` = 1024x768 8 bit.
  * `vga=775` = 1280x1024 8 bit.
  * `vga=893` = 1920x1200 8 bit.
More info on this in the link section in the end of this document.


Hints
=====
For a disk list in the install environment type: `lsblk`.


Links
=====
  * (VESA BIOS Extensions)[http://en.wikipedia.org/wiki/VESA_BIOS_Extensions#Linux_video_mode_numbers]
