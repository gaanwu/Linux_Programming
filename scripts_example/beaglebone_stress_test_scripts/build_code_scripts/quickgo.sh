cd board-support/linux-3.14.26-g2489c02/
make -j4 ARCH=arm CROSS_COMPILE=/home/js/test_git/ti_sdk/linux-devkit/sysroots/i686-arago-linux/usr/bin/arm-linux-gnueabihf- zImage modules


sudo cp  drivers/net/wireless/atmel/wilc1000/wilc1000.ko /media/js/rootfs/
