@echo off
Set Process.Name.Default=Protocols.aubio.Wled1
REM call Keanu.location.bat

Echo Starting Aubio WLED1
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "AUBIO" -t Keanu\Protocol
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Keanu\Protocol\AUBIO
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "WLED1" -t Keanu\Protocol\AUBIO
cd protocols.aubio.Wled1
conda activate ledfx && cd K:\Protocols.Aubio.Wled1 && python visualization.py
REM cd K:\Protocols.Aubio.Wled1
REM python visualization.py