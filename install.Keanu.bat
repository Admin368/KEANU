@echo off
set
set Process.Name=install.Keanu
call keanu.location.bat

:phase01
Echo Keanu: What Wuld You Like To install?

Echo [Yes/No]?
echo "Exit" to Exit
set /P c=What Should i Do?:
if /I "%c%" EQU "Yes" goto :Done
if /I "%c%" EQU "Y" goto :Done
if /I "%c%" EQU "No" goto :PlanB
if /I "%c%" EQU "N" goto :PlanB
if /I "%c%" EQU "Exit" goto :Exit
if /I "%c%" EQU "E" goto :Exit
goto phase02
:Exit
keanu.exit.bat







