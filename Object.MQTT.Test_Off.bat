@echo off
Set Process.Name.Default=Object.MQTT.Test_Off
call keanu.location.bat

echo switching off Test
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t state/hassio/test