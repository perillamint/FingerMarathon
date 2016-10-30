#!/usr/bin/env bash

#register kernel module, to start without rebooting
modprobe fingermarathon

#Automatically insert module after rebooting
echo "fingermarathon" > /etc/modules-load.d/fingermarathon.conf

echo "cat /sys/module/fingermarathon/parameters/keycount" > /usr/bin/fingermarathon
chmod +x /usr/bin/fingermarathon
