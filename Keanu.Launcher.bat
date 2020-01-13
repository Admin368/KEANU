@echo off
set Q01=None
if %launcher?%==Yes goto :Launcher_Essentials
goto :Launcher_Variables

Echo No Launcher used
Echo Default Launcher Variables being Set
pause

:Launcher_Variables
Set Launcher?=Yes
set Launcher=%Process.Name%
set Speech.Enable=Yes
set Keanu.Speech=ON
set FullScreen=Yes
set MQTT.Request=False
set NodeRed.Request=False
Set Loading=Yes
Set Launch_Question=No
Set MM=No
Set Fast_Keanu=No
Set Use_Admin=No
Set Use_Pre_User=No
Set Pre_User=None

:Launcher_Essentials
call mount.bat
title %Launcher% %Keanu_Name% %version%
echo %keanu.date.time% %Launcher% calling [KeanuLocation.bat] >>%access.logs%
call location.bat



:Launcher_Log
echo %keanu.date.time% Launcher started [%launcher%] >>%access.logs%



echo %Use_Admin%|findstr /i "on"
if %errorlevel% equ 0 goto :Set_Admin
echo %Use_Admin%|findstr /i "Yes"
if %errorlevel% equ 0 goto :Set_Admin
echo %Use_Admin%|findstr /i "True"
if %errorlevel% equ 0 goto :Set_Admin
echo %Use_Pre_User%|findstr /i "on"
if %errorlevel% equ 0 goto :Pre_User
echo %Use_Pre_User%|findstr /i "Yes"
if %errorlevel% equ 0 goto :Pre_User
echo %Use_Pre_User%|findstr /i "True"
if %errorlevel% equ 0 goto :Pre_User
goto :Stage_1
:Set_Admin
Set /P User=<Keanu.Adm.txt
goto :Stage_1

:Pre_User
Set user=%Pre_User%
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
if /I "%Q01%" EQU "Yes" goto :Stage_1.5
if /I "%Q01%" EQU "Y" goto :Stage_1.5
if /I "%Q01%" EQU "No" goto :nolaunch
if /I "%Q01%" EQU "N" goto :nolaunch
if /I "%Q01%" EQU "Exit" goto :nolaunch
if /I "%Q01%" EQU "E" goto :nolaunch
if /I "%Q01%" EQU "S" goto :startpage
if /I "%Q01%" EQU "MM" goto :MasterMode
REM if /I "%Q01%" EQU "L" goto :Logic
REM if /I "%Q01%" EQU "Logic" goto :Logic
set /P Q01=Hi ,Should i Launch KEANU Systems [Yes/No]?
Echo %keanu.date.time% User: launch? User_Input = %Q01% >>%access.logs%
goto :Launcher_Question



:Stage_1.5
:User
Set Name=%User%
:User_2
if /i "%name%"=="N" goto :Newuser

for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Users.txt) do (

if /i "%name%"=="%%a" (
set reply=%%b
call reply.bat
set user=%%a
timeout /t 3
cls
goto :Stage_2
)
)

Echo sorry Your name is not Registered /No User Entered
set /p name= Enter User :
goto :User_2

:NewUser
set reply=Setup New User
call reply.bat
set /p NU="New UserName: "
REM if /i "%NU%"=="What time is it?" goto :TIME
for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Users.txt) do (

if /i "%NU%"=="%%a" (
Set reply=User Already Exists
call reply.bat
goto :User
)
)
set /p WM=%BotName%: Your Welcome Message?
echo %NU%{echo %WM%>>Keanu.LogicData.Users.txt
Set reply=Thanks! USer %WM% Registered
call reply.bat
goto :User


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
echo %keanu.date.time% User:%user% calling [keanu.logic.Main.Start] >>%access.logs%
REM Keanu.Logic.bat
keanu.logic.Main.Start.bat
goto :Error

:Stage_4
:MasterMode
Set reply= MasterMode is currently obselete
call reply.bat
REM goto :Stage_1
timeout /t
Echo Creator mode being started
echo %keanu.date.time% Creator mode being started >>%access.logs%
echo %keanu.date.time% Calling [CreatorMode.bat] >>%access.logs%
REM pause
set reply=Creator Mode initiated
call reply.bat
CreatorMode.bat
goto :Error

:Stage_5
:Fast_Keanu
echo %keanu.date.time% Fast_Keanu Used by %Process.name% >>%access.logs%
cls
cd K:\
if %
cls
Echo KEANU (C) 2019 107_Studios
Echo Fast_Keanu_Prompt
Echo Mount type: %Mount_type%
Keanu.Logic.Main.bat
goto :Error

:startpage
echo What Can I Do For You?
call Keanu.location.bat
echo %keanu.date.time% calling [blankkeanu.bat] >>%access.logs%
blankkeanu.bat
pause
goto :EOF

:nolaunch
set reply=KEANU Was Not Launched
call reply.bat
echo %keanu.date.time% KEANU Was Not Launched [keanu.Exit] >>%access.logs%
echo %keanu.date.time% KEANU calling [keanu.Exit] >>%access.logs%
call Keanu.location.bat
keanu.Exit.bat
pause

:OwnName
Set reply=that your own name
call reply.bat
goto :Logic

:Error
set Error_List=R02
call Error_List.bat
pause
:EOF