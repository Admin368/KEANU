@echo on
call Keanu.location.bat

goto :start01

:start01
curl "http://192.168.1.106/cm?user=admin&password=mqtt&cmnd=power%%20toggle"
echo Lights Toggled
echo Anything else
goto :end

:end
Echo Done
pause