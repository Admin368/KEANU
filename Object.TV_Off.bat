@echo off
Set Process.Name.Default=Object.TV_Off
call keanu.location.bat

echo switching off the TV
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "TV" -t Keanu\Objects
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t Keanu\Objects\TV