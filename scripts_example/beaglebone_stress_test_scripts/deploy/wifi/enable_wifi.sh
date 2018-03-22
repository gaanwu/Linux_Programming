cd /
insmod wilc1000.ko
sleep 1
ifconfig wlan0 up
sleep 1
sh supplicant.sh
sleep 1
