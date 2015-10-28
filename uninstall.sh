#!/usr/bin/env bash

#remove module from startup script
sed -i "/\b\(fingermarathon\)\b/d" /etc/modules

#OPTIONAL, remove helper
rm /bin/fingermarathon

rmmod fingermarathon

#remove module itself
rm /lib/modules/`uname -r`/fingermarathon.ko

#update kernel dependency
depmod