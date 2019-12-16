@echo %Debug%
@echo %Debug%
Set Process.Name.Default=Object.XLED_ON
call keanu.location.bat


echo switching ON XLED lights

mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "XLED" -t Keanu\Objects
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Keanu\Objects\XLED