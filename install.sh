#!/usr/bin/env bash

if [ "$KDIR" = "" ] #empty KDIR definition
then
    KDIR=/lib/modules/`uname -r`/build
fi

#remove previous failed attempt
make -C $KDIR M=$PWD clean

#build module
make -C $KDIR EXTRA_CFLAGS=-fno-pic M=$PWD modules

cp fingermarathon.ko /lib/modules/`uname -r`/fingermarathon.ko

make -C $KDIR M=$PWD clean

#inject current user's startup script

echo fingermarathon >> /etc/modules

#update kernel dependency
depmod

#register kernel module, to start without rebooting
insmod /lib/modules/`uname -r`/fingermarathon.ko

#OPTIONAL, register helper in path
echo "cat /sys/module/fingermarathon/parameters/keycount" > /bin/fingermarathon
chmod +x /bin/fingermarathon