@echo off
Set Process.Name.Default=Object.FrontDoor_OFF
call Keanu.location.bat

goto :start01

:start01
curl "http://192.168.1.201/cm?user=admin&password=mqtt&cmnd=power%%20off"
echo Done
echo Lights Off