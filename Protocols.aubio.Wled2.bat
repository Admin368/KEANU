@echo off
Set Process.Name.Default=Protocols.aubio.Wled2
call Keanu.location.bat

Echo Starting Aubio WLED2
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "AUBIO" -t Keanu\Protocol
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Keanu\Protocol\AUBIO
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "WLED2" -t Keanu\Protocol\AUBIO
conda activate ledfx && cd K:\Protocols.Aubio.Wled2 && python visualization.py
REM cd protocols.aubio.Wled2
REM python visualization.py