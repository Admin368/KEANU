@echo off
REM if %Username% equ "SERVER68$" goto :EOF
Set Run_Once=Yes
:: for this whole session Run_once= yes and the below code will
:: run once even tho location.bat is called many times
:: and at end of sessio the value will reset
Echo %Run_Once%|findstr /i "Yes"
if %errorlevel% equ 0 (
:Run_Once
type Keanu.Config.bat >>%access.logs%
)
echo %keanu.date.time% User:%user% Fired Process [keanu.Date.Time.bat] called by [Keanu.Location.Bat]>>%access.logs%
call keanu.Date.Time.bat
call Keanu.Config.bat
echo %keanu.date.time% User:%user% Process [%Process.Name%] Started >>%access.logs%
echo %keanu.date.time% User:%user% Fired Process [Keanu.Location.Bat] called by [%Process.Name%]>>%access.logs%
echo %keanu.date.time% User:%user% Fired Process [Keanu.Config.Bat] called by [%Process.Name%]>>%access.logs%

set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
set Process.Name=%Process.Name.Default%
goto :Config_old

:Config_New

:Config_old
net use K: \\192.168.1.168\keanu >nul 2>nul
net use H: \\192.168.1.168\keanu.Heavy >nul 2>nul



goto :Location_Main
:Location_Main
K:




set BotName=K.E.A.N.U
set /p Version=<keanu.version.txt


title %BotName% %Version% Process [%Process.Name%]




echo %keanu.date.time% User:%user% Process Ended [Keanu.Location]  >>%access.logs%

echo %keanu.date.time% User:%user% Process [%Process.Name%] Last Used>>%access.logs%