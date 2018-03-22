i=0
while [ "${i}" != "10000" ]
do
echo "========= loop $i ==========="
sh enable_wifi.sh
sh connect_temp.sh
dhclient wlan0

loop=0
while [ "${loop}" != "1" ]
do

  if wpa_cli status | grep -q "wpa_state=COMPLETED"
  then
      loop=1
      echo "Auth SUCCESS"
  else
      loop=0
      echo "Auth not yet"
      sleep 10
  fi
done


ping 10.100.83.254 -c 5
sh disable_wifi.sh
 PID=`wpa_supplicatn`
 kill $PID
i=$(($i+1))
sleep 2
done
