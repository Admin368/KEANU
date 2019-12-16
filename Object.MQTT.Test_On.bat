@echo %Debug%
Set Process.Name.Default=Object.MQTT.Test_On
call keanu.location.bat

echo switching on Test
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t state/hassio/test