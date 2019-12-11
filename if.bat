@echo off
call Keanu.location.bat

:0
set below5="1"
set above5=6
set Return=gohome

set /P c=name a number?
if /I "%c%" EQU "%below5%" goto :Below5
if /I "%c%" EQU "%above5%" goto :Above5
if /I "%c%" EQU "%Return%" goto :Return
if /I "%c%"
goto :0

:Below5
echo number is below 5
goto :0

:Above5
echo number is above 5
echo 
goto :0

:Return
Echo Okay
pause
goto :0