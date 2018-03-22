wpa_cli -i wlan0 scan
wpa_cli -i wlan0 scan_result
sleep 1
wpa_cli -i wlan0 remove_network 0
wpa_cli -i wlan0 ap_scan 1
sleep 1
wpa_cli -i wlan0 add_network 0
wpa_cli -i wlan0 set_network 0 ssid '"Delta-Office"'
wpa_cli -i wlan0 set_network 0 key_mgmt WPA-EAP
wpa_cli -i wlan0 set_network 0 eap PEAP
wpa_cli -i wlan0 set_network 0 eapol_flags 0
wpa_cli -i wlan0 set_network 0 identity '"js.wu"'
wpa_cli -i wlan0 set_network 0 password '"Delta9999"'
wpa_cli -i wlan0 set_network 0 phase2 '"auth=MSCHAPV2"'
wpa_cli -i wlan0 set_network 0 priority 10
wpa_cli -i wlan0 save_config
sleep 1
wpa_cli -i wlan0 enable_network 0
wpa_cli -i wlan0 select_network 0
sleep 1

dhclient wlan0
