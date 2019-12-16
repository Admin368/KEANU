@echo %Debug%
Set Process.Name=Keanu.Main


:Launcher_Variables
set Launcher=Keanu.Main
set Speech.Enable=Yes
set FullScreen=Yes
set Keanu.Speech=ON
set MQTT.Request=False
set NodeRed.Request=False

:Launcher_Essentials
title %Launcher% %Keanu_Name% %version%
echo %keanu.date.time% %Launcher% calling [KeanuLocation.bat] >>%access.logs%
call location.bat


:Launcher_Log
echo %keanu.date.time% Launcher started [%launcher%] >>%access.logs%



:Launcher_Main
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
