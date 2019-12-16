@echo %debug%
:Check_Mount
if %Mount_Used%==Yes goto

:No_Mount
Echo Fatal Error #001
Echo Mount Wa
:Location
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@LOCATION.START@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@>>%access.logs%
echo %keanu.date.time% User:%user% Process [%Process.Name%] Started >>%access.logs%


:Run_Once
echo %Run_Once%|findstr /i "Yes"
if %errorlevel% equ 0 (
set Run_Once=Yes
:Run_Once_Code
:: put any commands you wanna run once here

)

:Location_Log
echo %keanu.date.time% User:%user% Process [%Process.Name%] Started >>%access.logs%

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

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@LOCATION.END@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >>%access.logs%
:EOF