@echo off
Set Process.Name=keanu.logic.Variables
Echo %Process.Name% calling [Location.bat]>>%access.Logs%
call keanu.location
goto :068

:Done
call keanu.logic.main.bat

:Mood.Setup
call keanu.Moods.Check.0.Bat
goto :Mood.Setup.2

:Mood.Setup.2
set NodeRed.Request=True
Set Mood="%TEXT%"
REM mosquitto_pub -h 192.168.1.170 -p 1883 -m "SETX NodeRedRequest" "%NodeRed.Request%"" -t Mood\Transfer
REM mosquitto_pub -h 192.168.1.170 -p 1883 -m "SETX Mood "%Text%"" -t Mood\Transfer
REM mosquitto_pub -h 192.168.1.170 -p 1883 -m "SETX Mood "%Mood%"" -t Mood\Transfer
REM timeout /t 1
REM mosquitto_pub -h 192.168.1.170 -p 1883 -m "KEANU.BYPASS && Call Keanu.Moods.Check.bat" -t Mood\Transfer
REM call Keanu.Moods.Check.bat

Echo SET NodeRedRequest=%NodeRed.Request%>K:\Keanu.Transfer\Transfer2.bat
Echo SET Mood=%Text%>>K:\Keanu.Transfer\Transfer2.bat
Echo SET TEXT=%MOOD%>>K:\Keanu.Transfer\Transfer2.bat
Echo Call KEANU.BYPASS>>K:\Keanu.Transfer\Transfer2.bat
REM Echo Call Keanu.Moods.Check.bat>>K:\Keanu.Transfer\Transfer2.bat
Echo call K:\Keanu.Transfer\Delete.Transfer.bat>>K:\Keanu.Transfer\Transfer2.bat
Echo Exit>>K:\Keanu.Transfer\Transfer2.bat

Call Keanu.Moods.Check.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "Launch" -t Mood\Transfer\State
goto :Done
REM ==========================TRIGGERS==============================================================================
:Triggers
echo %text%|findstr /i "ON" >nul
if %errorlevel% equ 0 (
SET POWER=ON
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "OFF" >nul
if %errorlevel% equ 0 (
SET POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "OF" >nul
if %errorlevel% equ 0 (
set reply=Did you mean "Off"
call reply
goto :Syntax_Wrong
goto :Done
)
echo %text%|findstr /i "START" >nul
if %errorlevel% equ 0 (
SET POWER=ON
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "STAR" >nul
if %errorlevel% equ 0 (
set reply=Did you Mean "Start"
goto :Syntax_Wrong
goto :Done
)
echo %text%|findstr /i "END" >nul
if %errorlevel% equ 0 (
SET POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "STOP" >nul
if %errorlevel% equ 0 (
SET POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "HOT" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Turn" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Switch" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Enable" >nul
if %errorlevel% equ 0 (
set POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Disable" >nul
if %errorlevel% equ 0 (
set POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Kill" >nul
if %errorlevel% equ 0 (
set POWER=OFF
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
goto :EOF


REM ==========================Syntax_Wrong==========================================================================
:Syntax_Wrong
:Syntax
set reply=Didnt understand Sorry
call Reply
echo Write Syntax as " Switch (State(On/Off)) (the) (object)
timeout /t 3
goto :Done
REM ==========================SPEECH.SETUP==========================================================================
:Speech.Setup
echo %text%|findstr /i "Allow" >nul
if %errorlevel% equ 0 (
goto :Speech.On
goto :Done
)
echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Speech.On
goto :Done
)
echo %text%|findstr /i "Enable" >nul
if %errorlevel% equ 0 (
goto :Speech.On
goto :Done
)
echo %text%|findstr /i "disable" >nul
if %errorlevel% equ 0 (
set reply=Speech mode disabled
call reply.bat
goto :Speech.Off
goto :Done
)
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
set Reply=Speech mode disabled
call reply.bat
goto :Speech.Off
goto :Done
)
echo %text%|findstr /i "Engine" >nul
if %errorlevel% equ 0 (
set Reply=starting speech engine
call reply.bat
call keanu.speech.Reply.bat
call keanu.Speech.bat
goto :Done
)
Set Reply=No Speech parameter found
call keanu.speech.Reply
goto :done

:Speech.On
REM setx Keanu.Speech ON
set Keanu.Speech=ON
set reply=Speech Mode On
call reply.bat
goto :Done

:Speech.Off
REM setx Keanu.Speech OFF
set Keanu.Speech=OFF
set reply=Speech Mode Off
call reply.bat
goto :Done

:Speech.Transfer
REM setx Keanu.Speech OFF
set Keanu.Speech=Transfers
set reply=Speech Transfer Fuction Activated
call reply.bat
goto :Done

REM ======================================FU=================================================================
:FU
echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
cd Keanu.Speech
call Fuck_off.bat
goto :Done
)
echo %text%|findstr /i "you" >nul
if %errorlevel% equ 0 (
cd Keanu.Speech
call Fuck_You_Too.bat
goto :Done
)

goto :Done

REM ==========================================TIME====================================================================
:Time
echo %text%|findstr /i "What" >nul
if %errorlevel% equ 0 (
Set reply=The time is %time%
goto :Done
)
Set reply=Time For what?
call reply.bat
goto :done
REM ==========================================DATE====================================================================
:Date
echo %text%|findstr /i "What" >nul
if %errorlevel% equ 0 (
set reply=it is the year of %year% in the %Month%'th Month of day %Day%
call reply.bat
goto :Done
)
echo failed
goto :done
REM ========================================ORDER_66===================================================================
:Order
Echo %text%|findstr /i "66" >nul
if %errorlevel% equ 0 (
goto :Order_66
)
if %errorlevel% equ 1 (
goto :Order_66
set reply=Order No Found
call reply.bat
set reply=You are a liar and a theif
call reply.bat
goto :Done
)
:Order_66
Echo %text%|findstr /i "Start" >nul
if %errorlevel% equ 0 (
goto :Order_66_Start
)
Echo %text%|findstr /i "Launch" >nul
if %errorlevel% equ 0 (
goto :Order_66_Start
)
Echo %text%|findstr /i "Commence" >nul
if %errorlevel% equ 0 (
goto :Order_66_Start
)
Echo %text%|findstr /i "Execute" >nul
if %errorlevel% equ 0 (
goto :Order_66_Start
)
Echo %text%|findstr /i "On" >nul
if %errorlevel% equ 0 (
goto :Order_66_Start
)

Echo %text%|findstr /i "Terminate" >nul
if %errorlevel% equ 0 (
goto :Order_66_Stop
)
Echo %text%|findstr /i "Stop" >nul
if %errorlevel% equ 0 (
goto :Order_66_Stop
)
Echo %text%|findstr /i "Abort" >nul
if %errorlevel% equ 0 (
goto :Order_66_Stop
)
Echo %text%|findstr /i "Off" >nul
if %errorlevel% equ 0 (
goto :Order_66_Stop
)

set reply=Order No Found
call reply.bat
set reply=You are a liar and a theif
call reply.bat
goto :Done

:Order_66_Start

call Protocols.Order_66.bat
goto :Done

:Order_66_Stop

call Protocols.Order_66.Abort.bat
goto :Done
REM ========================================VARIABLES==================================================================
:068
echo %text%|findstr /i "Speech" >nul
if %errorlevel% equ 0 (
goto :Speech.Setup
goto :Done
)
echo %text%|findstr /i "Mood" >nul
if %errorlevel% equ 0 (
goto :Mood.Setup
goto :Done
)
echo %text%|findstr /i "Fuck" >nul
if %errorlevel% equ 0 (
goto :FU
)
echo %text%|findstr /i "effect" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Color" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Colour" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Mode" >nul
if %errorlevel% equ 0 (
goto :Mood.Setup
goto :Done
) 
echo %text%|findstr /i "love" >nul
if %errorlevel% equ 0 (
set reply=Dont fall in Love with me baby,Im too good for you.
call reply.bat
goto :Done
)
echo %text%|findstr /i "hate" >nul
if %errorlevel% equ 0 (
set reply=i hate you too
goto :Done
)
echo %text%|findstr /i "like" >nul
if %errorlevel% equ 0 (
set reply=i dont like you either
call reply.bat
goto :Done
)
echo %text%|findstr /i "sleep" >nul
if %errorlevel% equ 0 (
set reply=i'm sorry i dont sleep.
call reply.bat
goto :Done
)
echo %text%|findstr /i "screen" >nul
if %errorlevel% equ 0 (
set reply=Did you mean Full Screen
call reply.bat
goto :Done
)
REM echo %text%|findstr /i "Switch" >nul
REM if %errorlevel% equ 0 (
REM echo Write Syntax as " Switch (State(On/Off)) (the) (object)
REM goto :Done
REM )
echo %text%|findstr /i "Server68" >nul
if %errorlevel% equ 0 (
echo MQTT forwarding to Server68
set MQTT.Request=True
set MQTT.Request=%text%
goto :Done
)
echo %text%|findstr /i "Switch" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Turn" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Light" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Fan" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Aubio" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "LedFx" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Thor" >nul
if %errorlevel% equ 0 (
Echo Thunder Baby
mosquitto_pub -h 192.168.1.170 -p 1883 -u mqtt -P mqtt -m "END" -t MOOD\THOR
goto :Done
)
echo %text%|findstr /i "xLEd" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Wled" >nul
if %errorlevel% equ 0 (
call Keanu.Logic.Variable.Objects.bat
goto :Done
)
echo %text%|findstr /i "Time" >nul
if %errorlevel% equ 0 (
goto :time
)
echo %text%|findstr /i "Date" >nul
if %errorlevel% equ 0 (
goto :date
)
echo %text%|findstr /i "Order" >nul
if %errorlevel% equ 0 (
goto :Order
)













goto :Triggers
:EOF