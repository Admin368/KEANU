@echo off
Set Process.Name.Default=Object.AC_Off
call keanu.location.bat

echo switching off The AC
Start /B mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "AC" -t Keanu\Objects
Start /B mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t Keanu\Objects\AC