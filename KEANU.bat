@echo off
Set Process.Name=Keanu.Main
call keanu.Request.Admin.bat




net use K: \\192.168.1.168\keanu >nul 2>nul
K:
call keanu.date.time.bat

set Access.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Access.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"


set Access.Error= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Errors= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acess.Errors= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Acces.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Acess.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Aces.Logs\%Keanu.date.time%Fatal.txt"

set Speech.Enable=Yes
set Keanu.Speech=ON
set MQTT.Request=False
set NodeRed.Request=False
REM SETX NodeRedRequest "False"
REM SETX Text "None"
REM SETX Mood "None"



Echo SET NodeRedRequest=%NodeRed.Request%>K:\Keanu.Transfer\Transfer.bat
Echo SET Mood=End Mood>>K:\Keanu.Transfer\Transfer.bat
Echo SET TEXT=End Mood>>K:\Keanu.Transfer\Transfer.bat
Echo Call KEANU.BYPASS>>K:\Keanu.Transfer\Transfer.bat
Echo Call Keanu.Moods.Check.bat>>K:\Keanu.Transfer\Transfer.bat
Echo Exit>>K:\Keanu.Transfer\Transfer.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "ON" -t Mood\Transfer\State



Echo %keanu.date.time% User:%user% Support_Process [Keanu.Request.Admin] Was Called by [Keanu.Main] >>%access.logs%
Echo %keanu.date.time% User:%user% Support_Process [Keanu.Date.Time] Was Called by [Keanu.Main]>>%access.logs%

echo %keanu.date.time% Current Location [Keanu.bat] >>%access.logs%
echo %keanu.date.time% calling [KeanuLocation.bat] >>%access.logs%
call Keanu.location.bat
echo %keanu.date.time% User:%user% Process [Keanu.Request.Admin] Was Called >>%access.logs%


echo ############################### >>%access.logs%
echo ############################### >>%access.logs%
echo Keanu Version %Version% >>%access.logs%
echo Keanu Session Started >>%access.logs%
echo Keanu Started Date %keanu.date% >>%access.logs%
echo Keanu Started Time %keanu.time% >>%access.logs%
echo ############################### >>%access.logs%
echo ############################### >>%access.logs%

echo %keanu.date.time% Setting Botname >>%access.logs%
set Botname=KEANU
title %BotName% 3.0


echo %keanu.date.time% calling [keanu.pause.bat] >>%access.logs%
call keanu.pause

echo %keanu.date.time% Adjusting View To Full Screen >>%access.logs%
CLS
REM mode con lines=32766
Echo %keanu.date.time% User:%user% Support_Process [Keanu.FullScreen] Was Called by [Keanu.Main]>>%access.logs%
call FULLSCREEN.BAT
REM mode con:cols=80 lines=100


cls
echo 107_Studios
echo %keanu.date.time% [Keanu.Main] calling [keanu.logo.bat] >>%access.logs%
call keanu.logo.bat
echo %keanu.date.time% [Keanu.Main] calling [keanu.version.bat] >>%access.logs%
call keanu.version.bat

goto start02


:start02
if /I "%Q01%" EQU "Yes" goto :loading
if /I "%Q01%" EQU "Y" goto :loading
if /I "%Q01%" EQU "No" goto :nolaunch
if /I "%Q01%" EQU "N" goto :nolaunch
if /I "%Q01%" EQU "Exit" goto :nolaunch
if /I "%Q01%" EQU "E" goto :nolaunch
if /I "%Q01%" EQU "S" goto :startpage
if /I "%Q01%" EQU "MM" goto :MasterMode
if /I "%Q01%" EQU "L" goto :Logic
if /I "%Q01%" EQU "Logic" goto :Logic
set /P Q01=Hi ,Should i Launch KEANU Systems [Yes/No]?
Echo %keanu.date.time% User: launch? User_Input = %Q01% >>%access.logs%
goto :start02


:start01
Echo Launch _KEANU_ ?
set /P ON=
if not defined ON goto loading


:loading
call Keanu.loading.bat
Echo KEANU_LOGIC starting
set reply=Interface Active.
call reply.bat
call keanu.logic.bat
pause

:Logic
Echo KEANU_LOGIC starting
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
Keanu.Logic.Main.Start.bat
pause

:startpage
echo What Can I Do For You?
call Keanu.location.bat
echo %keanu.date.time% calling [blankkeanu.bat] >>%access.logs%
blankkeanu.bat
pause

:nolaunch
Echo KEANU Was Not Launched
echo %keanu.date.time% KEANU Was Not Launched [keanu.Exit] >>%access.logs%
echo %keanu.date.time% KEANU calling [keanu.Exit] >>%access.logs%
call Keanu.location.bat
keanu.Exit.bat
pause

:MasterMode
Echo Creator mode being started
echo %keanu.date.time% Creator mode being started >>%access.logs%
echo %keanu.date.time% Calling [CreatorMode.bat] >>%access.logs%
REM pause
set reply=Creator Mode initiated
call reply.bat
call CreatorMode.bat
