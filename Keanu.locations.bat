@echo off
if %Username% equ "SERVER68$" goto :EOF
echo %keanu.date.time% User:%user% Fired Process [keanu.Date.Time.bat] called by [Keanu.Location.Bat]>>%access.logs%
call keanu.Date.Time.bat
echo %keanu.date.time% User:%user% Process [%Process.Name%] Started >>%access.logs%
echo %keanu.date.time% User:%user% Fired Process [Keanu.Location.Bat] called by [%Process.Name%]>>%access.logs%

set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
set Process.Name=%Process.Name.Default%

net use K: \\192.168.1.168\keanu >nul 2>nul
K:




set BotName=K.E.A.N.U
set /p Version=<keanu.version.txt


title %BotName% %Version% Process [%Process.Name%]




echo %keanu.date.time% User:%user% Process Ended [Keanu.Location]  >>%access.logs%

echo %keanu.date.time% User:%user% Process [%Process.Name%] Last Used>>%access.logs%