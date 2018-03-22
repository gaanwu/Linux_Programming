wpa_cli -i wlan0 scan
sleep 1
wpa_cli -i wlan0 scan_result
sleep 1
wpa_cli -i wlan0 remove_network 0
sleep 1
wpa_cli -i wlan0 add_network 0
sleep 1
wpa_cli -i wlan0 set_network 0 ssid '"Netvox_Test"'
sleep 1
wpa_cli -i wlan0 set_network 0 key_mgmt WPA-PSK
sleep 1
wpa_cli -i wlan0 set_network 0 psk '"1234567890"'
sleep 1
wpa_cli -i wlan0 save_config
sleep 1
wpa_cli -i wlan0 enable_network 0
sleep 1
wpa_cli -i wlan0 select_network 0
sleep 2

dhclient wlan0

