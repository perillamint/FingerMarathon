#!/usr/bin/env bash

#register kernel module, to start without rebooting
modprobe fingermarathon

echo "cat /sys/module/fingermarathon/parameters/keycount" > /bin/fingermarathon
chmod +x /bin/fingermarathon
