@echo off
cls
Set Process.Name=keanu.logic.Main.Start
call keanu.location.bat
echo %keanu.date.time% User:%user started [Keanu.Logic.Main.Start] >>%access.logs%
goto :001254

:001254
cls
color 16
echo %keanu.date.time% User:%user calling [keanu.logo.bat] >>%access.logs%
call keanu.logo.bat
REM 2>>%access.logs%

echo %keanu.date.time% User:%user calling [keanu.version.bat] >>%access.logs%
call keanu.version.bat
REM 2>>%access.logs%

echo %keanu.date.time% User:%user calling [keanu.Logic.Main.bat] >>%access.logs%
keanu.Logic.Main.bat
