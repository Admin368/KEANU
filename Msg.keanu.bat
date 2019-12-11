@echo off
call Keanu.location.bat


:start02

echo Options
echo "Custom" or Use "C"
echo "Errors" or Use "E"
echo "Exit"   or use "Ex"
echo "Back"   or Use "B"

set /P c=What Message should i send to the PC?
if /I "%c%" EQU "C" goto :loading
if /I "%c%" EQU "Custom" goto :loading



:Custom

goto



:Errors
Msg.keanu.Errors.bat



:Exit
keanu.exit.bat


:Back
keanu.logic.bat