@echo off
Set Process.Name.Default=Object.Wled.All_Off
call keanu.location.bat

echo switching off All WLED lights
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t wled/all


mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "WLED" -t Keanu\Objects
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t Keanu\Objects\WLED