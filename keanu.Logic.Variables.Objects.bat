@echo %Debug%
Set Process.Name=keanu.logic.Variables.Switch
call keanu.location
goto :Object

:Done
call keanu.logic.main.bat

Rem =======================================Heater=====================================================================
:Heater
Echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Heater_On
)
Echo %text%|findstr /i "start" >nul
if %errorlevel% equ 0 (
goto :Heater_On
)
Echo %text%|findstr /i "Hot" >nul
if %errorlevel% equ 0 (
goto :Heater_On
)
Echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Heater_On
)
Echo %text%|findstr /i "up" >nul
if %errorlevel% equ 0 (
goto :Heater_On
)
Echo %text%|findstr /i "off" >nul
if %errorlevel% equ 0 (
goto :Heater_Off
)
Echo %text%|findstr /i "stop" >nul
if %errorlevel% equ 0 (
goto :Heater_Off
)
Echo %text%|findstr /i "end" >nul
if %errorlevel% equ 0 (
goto :Heater_Off
)

set reply=Specify the AC Command
call reply.bat
goto :Done
:Heater_on
call Object.AC_Heater_On.bat
goto :Done
:Heater_off
call Object.AC_Heater_Off.bat
goto :Done

goto :Done

REM ===================Effect===================
:Effect

set Reply=Trying To Set Effect
call keanu.speech.Reply.bat
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "%text%" -t Wled\Effect
goto :Done




REM ===================OBJECT.FAN===================
:Fan
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Fan.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :Fan.Off
)
goto :Sorry


:Fan.On
set reply=Turning Fan On
call reply.bat
call object.107fan_on.bat
goto :Done

:Fan.Off
set reply=Turning Fan Off
call reply.bat
call object.107fan_off.bat
goto :Done



REM ===================OBJECT.XLED===================
:xled
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :XLED.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :XLED.Off
)
goto :Sorry


:XLED.On
set reply=Turning XLED On
call reply.bat
call Object.XLED_On.bat
goto :Done

:XLED.Off
set reply=Turning XLED Off
call reply.bat
call Object.XLED_Off.bat
goto :Done




REM ===================OBJECT.WLED===================
:Wled
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :WLED.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :WLED.Off
)
goto :Sorry


:WLED.On
set reply=Turning WLED ON
call reply.bat 
call Object.Wled.All_On.bat
goto :Done

:WLED.Off
set reply=Turning WLED OFF
call reply.bat
call Object.Wled.All_Off.bat
goto :Done





REM ===================OBJECT.LIGHTS===================
:Lights
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Lights.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :Lights.Off
)
echo %text%|findstr /i "Out" >nul
if %errorlevel% equ 0 (
goto :Lights.Off
)
goto :Sorry


:Lights.On
set reply=Switching On All Lights
call reply.bat
call Object.XLED_On.bat
call Object.Wled.All_On.bat
goto :Done

:Lights.Off
set reply=Switching Off All Lights
call reply.bat
call Object.XLED_Off.bat
call Object.Wled.All_Off.bat
goto :Done

:Lights.Color
set reply=Setting Room Color
call reply.bat
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "%text%" -t Keanu\Objects\Lights\col
goto :Done

REM ===================OBJECT.TV===================
:TV
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :TV.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :TV.Off
)
goto :Sorry


:TV.On
set reply=Turning the TV on.
call reply.bat 
call Object.TV_On.bat
goto :Done

:TV.Off
set reply=Turning the TV OFF.
call reply.bat
call Object.TV_Off.bat
goto :Done

REM ===================OBJECT.AC===================
:AC
REM goto :AC.NEW
REM how about replacing on values with 0 an 1
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :AC.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :AC.Off
)
goto :Sorry

:AC.NEW
if %POWER% equ on (
goto :AC.On
)
if %POWER% equ "off" (
goto :AC.Off
)

goto :Sorry

:AC.On
set reply=Turning AC on.
call reply.bat
call Object.AC_On.bat
goto :Done

:AC.Off
set reply=Turning AC Off.
call reply.bat
call Object.AC_Off.bat
goto :Done

REM ===================Protocol.Aubio===================
:Aubio
echo %text%|findstr /i "Start" >nul
if %errorlevel% equ 0 (
goto :Aubio.On
)
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Aubio.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :Aubio.Off
)
goto :Aubio.On

:Aubio.On
Set reply=Starting Aubio
call reply.bat
call Protocols.aubio.Wled1.bat
call Protocols.aubio.Wled2.bat
goto :Done

:Aubio.Off
Set reply=Sorry Cannot stop Aubio
call reply.bat
Set Reply=Stop it Manually
call reply.bat
goto :Done


REM ===================Protocol.Ledfx===================
:Ledfx
echo %text%|findstr /i "Start" >nul
if %errorlevel% equ 0 (
goto :Ledfx.On
)
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Ledfx.On
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :Ledfx.Off
)
goto :Ledfx.On


:Ledfx.On
call Protocols.Ledfx_start_Server68.bat
REM set reply=Starting LEDFX protocol
REM call reply.bat

goto :Done

:Ledfx.Off
call Protocols.Ledfx_end_Server68.bat
REM Set reply=Ending LEDFX Protocol
REM call reply.bat
goto :Done

REM ===================OBJECT.INDENTIFY===================


:Object
REM ======================COLOR SELECT===============
echo %text%|findstr /i "Red" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Red
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Violet" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Violet
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Blue" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Blue
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Yellow" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Yellow
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "White" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to White
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Purple" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Purple
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Pink" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Pink
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Turquoise" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Turquoise
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Green" >nul
if %errorlevel% equ 0 (
set reply=Changing Lights Color to Green
call reply.bat
goto :Lights.Color
)
echo %text%|findstr /i "Color" >nul
if %errorlevel% equ 0 (
set reply=Please Enter the Color To change to
call reply.bat
goto :Done
)
echo %text%|findstr /i "Colour" >nul
if %errorlevel% equ 0 (
set reply=Please Enter the Color To change to
call reply.bat
goto :Done
)
REM ======================REST OF OBJECTS===============
echo %text%|findstr /i "effect" >nul
if %errorlevel% equ 0 (
goto :Effect
)
echo %text%|findstr /i "Fan" >nul
if %errorlevel% equ 0 (
goto :Fan
)
echo %text%|findstr /i "Light" >nul
if %errorlevel% equ 0 (
goto :Lights
)
echo %text%|findstr /i "Lights" >nul
if %errorlevel% equ 0 (
goto :Lights
)
echo %text%|findstr /i "AC" >nul
if %errorlevel% equ 0 (
goto :AC
)
echo %text%|findstr /i "Air" >nul
if %errorlevel% equ 0 (
goto :AC
)
echo %text%|findstr /i "Conditioner" >nul
if %errorlevel% equ 0 (
goto :AC
)
echo %text%|findstr /i "TV" >nul
if %errorlevel% equ 0 (
goto :TV
)
echo %text%|findstr /i "Ledfx" >nul
if %errorlevel% equ 0 (
goto :Ledfx
)
echo %text%|findstr /i "Aubio" >nul
if %errorlevel% equ 0 (
goto :Aubio
)
echo %text%|findstr /i "wled" >nul
if %errorlevel% equ 0 (
goto :wled
)
echo %text%|findstr /i "xled" >nul
if %errorlevel% equ 0 (
goto :xled
)
echo %text%|findstr /i "Hot" >nul
if %errorlevel% equ 0 (
goto :Heater
)
echo %text%|findstr /i "Heat" >nul
if %errorlevel% equ 0 (
goto :Heater
)
echo %text%|findstr /i "Warm" >nul
if %errorlevel% equ 0 (
goto :Heater
)
echo %text%|findstr /i "Heater" >nul
if %errorlevel% equ 0 (
goto :Heater
)
echo %text%|findstr /i "Heat" >nul
if %errorlevel% equ 0 (
goto :Heater
)

















goto :Sorry
:Sorry
set reply=Didnt understand Sorry
call Reply
echo Write Syntax as " Switch (State(On/Off)) (the) (object)
goto :Done







