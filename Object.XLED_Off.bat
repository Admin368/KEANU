@echo off
Set Process.Name.Default=Object.XLED_Off
call keanu.location.bat


echo switching OFF XLED lights

mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "XLED" -t Keanu\Objects
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t Keanu\Objects\XLED