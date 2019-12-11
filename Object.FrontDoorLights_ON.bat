@echo off
Set Process.Name.Default=Object.FrontDoor_ON
call Keanu.location.bat

goto :start01

:start01
curl "http://192.168.1.201/cm?user=admin&password=mqtt&cmnd=power%%20on"
echo Done
echo Lights On
