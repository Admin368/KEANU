@echo off
Echo Error Keanu_Sidelaunch Used
Echo Checking Launcher use
Echo %launcher?%|findstr /i "Yes"
if %errorlevel% equ 0 (
goto :Main_Keanu
)
goto :No_Launcher


:No_Launcher
Echo if this is launched then
Echo Main Pipeline not followed
Echo Checking Mounted

cls
Set T=0
:loop_Load
if %T%==100 goto :Load_Done
set /a T=%T%+1
REM Echo Checking Launcher
Echo .
Echo ..
Echo ...%T%
goto :loop_Load

:Load_Done
cls
Echo Checking Complete
Echo Note From Keanu_V5
Echo start with Keanu_Launch
Echo To Start Keanu
Echo Keanu Voice now in V5
timeout /t 2
c:\keanu.config\keanu_launch.bat
goto :EOF

:Main_Keanu
cd /d K:
K:\keanu.bat
goto :EOF




:EOF


