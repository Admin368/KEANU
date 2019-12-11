@echo off
Set Process.Name=Keanu.Exit
call Keanu.location.bat
echo %keanu.date.time% User:%user% started Process [Keanu.Exit.bat] >>%Access.logs%

setlocal enabledelayedexpansion
set string[0]=bye %name%.
set string[1]=Good Day %name%.
set string[2]=later %name%.
set /a idx=%random% %%3
echo !string[%idx%]!
echo Keanu Shutting Down

echo Keanu Exiting Now %keanu.date.time% >>%Access.logs%
timeout /t 3
exit