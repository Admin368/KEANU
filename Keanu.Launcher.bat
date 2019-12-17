@echo off
if %launcher?%==Yes goto :Launcher_Essentials
goto :Launcher_Variables

Echo No Launcher used
Echo Default Launcher Variables being Set
pause

:Launcher_Variables
set Launcher=%Process.Name%
set Speech.Enable=Yes
set Keanu.Speech=ON
set FullScreen=Yes
set MQTT.Request=False
set NodeRed.Request=False
Set Loading_seq=
Set Launch-Question=
call Keanu.Launcher.bat

:Launcher_Essentials
call mount.bat
title %Launcher% %Keanu_Name% %version%
echo %keanu.date.time% %Launcher% calling [KeanuLocation.bat] >>%access.logs%
call location.bat


:Launcher_Log
echo %keanu.date.time% Launcher started [%launcher%] >>%access.logs%

goto :Stage_1

:Stage_1
:Launcher_Question
echo %Launcher_Question%|findstr /i "off"
if %errorlevel% equ 0 goto :Stage_2
echo %Launcher_Question%|findstr /i "No"
if %errorlevel% equ 0 goto :Stage_2
echo %Launcher_Question%|findstr /i "False"
if %errorlevel% equ 0 goto :Stage_2
cls
echo 107_Studios
echo %keanu.date.time% [Keanu.Main] calling [keanu.logo.bat] >>%access.logs%
call keanu.logo.bat
echo %keanu.date.time% [Keanu.Main] calling [keanu.version.bat] >>%access.logs%
call keanu.version.bat
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
goto :Launcher_Question






:start01
Echo Launch _KEANU_ ?
set /P ON=
if not defined ON goto loading


:Stage_2
:loading
echo %Loading%|findstr /i "off"
if %errorlevel% equ 0 goto :Stage_3
echo %Loading%|findstr /i "No"
if %errorlevel% equ 0 goto :Stage_3
echo %Loading%|findstr /i "False"
if %errorlevel% equ 0 goto :Stage_3
call Keanu.loading.bat
Echo KEANU_LOGIC starting
set reply=Interface Active.
call reply.bat
goto :Stage_3
pause
goto :Error


:Stage_3
:Logic
echo %MM%|findstr /i "on"
if %errorlevel% equ 0 goto :Stage_4
echo %MM%|findstr /i "Yes"
if %errorlevel% equ 0 goto :Stage_4
echo %MM%|findstr /i "True"
if %errorlevel% equ 0 goto :Stage_4
Echo KEANU_LOGIC starting
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
Keanu.Logic.Main.Start.bat
pause
goto :Error

:Stage_4
:MasterMode
Echo Creator mode being started
echo %keanu.date.time% Creator mode being started >>%access.logs%
echo %keanu.date.time% Calling [CreatorMode.bat] >>%access.logs%
REM pause
set reply=Creator Mode initiated
call reply.bat
CreatorMode.bat
goto :Error


:startpage
echo What Can I Do For You?
call Keanu.location.bat
echo %keanu.date.time% calling [blankkeanu.bat] >>%access.logs%
blankkeanu.bat
pause
goto :EOF

:nolaunch
set reply=Echo KEANU Was Not Launched
call reply.bat
echo %keanu.date.time% KEANU Was Not Launched [keanu.Exit] >>%access.logs%
echo %keanu.date.time% KEANU calling [keanu.Exit] >>%access.logs%
call Keanu.location.bat
keanu.Exit.bat
pause


:Error
set Error_List=R02
call Error_List.bat
:EOF