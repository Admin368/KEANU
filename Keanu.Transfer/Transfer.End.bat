taskkill /F /IM "vlc.exe"
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "End" -t Mood\End
call K:\Keanu.Transfer\Delete.Transfer.bat

