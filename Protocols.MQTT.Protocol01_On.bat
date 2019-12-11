@echo off
echo switching Protocol01
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "OFF" -t state/Protocols/01