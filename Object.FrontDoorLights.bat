@echo Off
Set Process.Name.Default=Object.FrontDoor.Lights
call Keanu.location.bat

echo KEANU Front Lights INDEX
goto :start01


:start01
cls
Echo KEANU: Dear Sir
Echo       Here are your options
Echo       1 - ON
Echo       2 - OFF
Echo       3 - BLINK
Echo       4 - BLINK OFF
Echo       5 - TOGGLE ON/OFF
Echo       E - Exit
set /P c=What State Would You Like The Lights TO be in [ON/OFF]?
if /I "%c%" EQU "ON" goto :1ON
if /I "%c%" EQU "1" goto :1ON
if /I "%c%" EQU "OFF" goto :2OFF
if /I "%c%" EQU "2" goto :2OFF
if /I "%c%" EQU "BLINK" goto :3BLINK
if /I "%c%" EQU "3" goto :3BLINK
if /I "%c%" EQU "BLINKOFF" goto :4BLINKOFF
if /I "%c%" EQU "4" goto :4BLINKOFF
if /I "%c%" EQU "TOGGLE" goto :5TOGGLE
if /I "%c%" EQU "5" goto :5TOGGLE
if /I "%c%" EQU "E" goto :end
goto :start01


:1ON
cls
call keanu.logo.bat
call keanu.version.bat
Call object.FrontDoorLights_ON.bat
echo FrontDoorLights On
pause
goto :start01


:2OFF
cls
call keanu.logo.bat
call keanu.version
call object.FrontDoorLights_OFF.bat
echo FrontDoorLights Off
pause
goto :start01

:3BLINK
cls
call keanu.logo.bat
call keanu.version
call object.FrontDoorLights_Blink.bat
echo FrontDoorLights Blinking
pause
goto :start01

:4BLINKOFF
cls
call keanu.logo.bat
call keanu.version
call object.FrontDoorLights_Blinkoff.bat
echo FrontDoorLights Blinking Stoped
pause
goto :start01

:5TOGGLE
cls
call keanu.logo.bat
call keanu.version
call object.FrontDoorLights_Toggle.bat
echo FrontDoorLight Toggled
pause
goto :start01

:End
call keanu.exit.bat
