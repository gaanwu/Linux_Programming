# switch to wifi
echo 117 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio117/direction
echo 1 > /sys/class/gpio/gpio117/value
# enable wpa_supplicant deamon
wpa_supplicant -Dnl80211 -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant.conf &

#switch restore
echo 0 > /sys/class/gpio/gpio117/value
