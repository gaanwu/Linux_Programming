i=0
while [ "${i}" != "10000" ]
do 
echo "========= loop $i ==========="
insmod wilc1000.ko
sh connect_temp.sh

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

udhcpc -i wlan0
ping 10.100.51.254 -c 5
ifconfig wlan0 down
rmmod wilc1000
 PID=`pidof udhcpc`
 kill $PID
i=$(($i+1))
sleep 2
done
