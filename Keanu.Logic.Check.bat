@echo off
Set Process.Name=keanu.Logic.Check
call keanu.location.bat
echo %keanu.date.time% User:%user% Process [Keanu.Logic.Check] started >>%access.logs%
goto :logic


:TIME
echo.
set reply=the time is %TIME%
call reply.bat
goto :logicMain

:DATE
echo.
set reply=The date is %DATE%
call reply.bat
goto :logicMain




:logic
:: DYNAMIC QUESTIONS THAT PULL REALTIME INFORMATION
if /i "%text%"=="What time is it?" goto :TIME
if /i "%text%"=="What is the time?" goto :TIME
if /i "%text%"=="What is the date?" goto :DATE
if /i "%text%"=="%user%" goto :Ownname
:: OUR SPEECH FILE
for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Speech.txt) do (

if /i "%text%"=="%%a" (



:check.MQTT.Request 
REM Echo Checking MQTT.Request Status
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status >>%access.logs%

Echo %MQTT.Request%|findstr /i "Yes True"
if %errorlevel% equ 0 (
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status [%errorlevel%] [%MQTT.Request%]>>%access.logs%
set MQTT.Target=192.168.1.168
set MQTT.Topic=MqttRequest
goto :MQTT.Engine
)
if %errorlevel% equ 1 (
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status [%errorlevel%] [%MQTT.Request%]>>%access.logs%
REM goto :Question
)

REM goto :Question

Echo %Speech.Enable%|findstr /i "Yes True"
if %errorlevel% equ 0 (
set Speech.text=%text%
set Speech.text=%%b
call Keanu.Speech.Engine.bat
Echo %keanu.date.time% KEANU REPLIED [SPEECH] [%%b] to input [%text%] asked by User:[%user%]>>%access.logs%
)
set Reply=%%b
call keanu.speech.reply.bat
REM Echo %%b
Echo %keanu.date.time% KEANU REPLIED  [TEXT]  [%%b] to input [%text%] asked by User:[%user%]>>%access.logs%
REM Timeout /t 1
goto :logicMain
)
)
for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Commands.txt) do (

if /i "%text%"=="%%a" (
%%b
REM Timeout /t 1
goto :logicMain
)
)
call keanu.logic.variables.bat
)
)
call keanu.logic.check.dir.bat
)
)
call Keanu.Logic.Writter.bat
pause

:logicMain
keanu.logic.main.bat


