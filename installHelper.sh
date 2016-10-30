#!/usr/bin/env bash

#register kernel module, to start without rebooting
modprobe fingermarathon

echo "cat /sys/module/fingermarathon/parameters/keycount" > /usr/bin/fingermarathon
chmod +x /usr/bin/fingermarathon
