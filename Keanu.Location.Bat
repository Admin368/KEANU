@echo %debug%
Echo Location Service starting
:Check_Mount
if %Mount_Used%==Yes goto :Location

:No_Mount
::Error R01 :No mount
Set Error=R01
call Error_List.bat


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

:Location_Main

:Location_Log
echo %keanu.date.time% User:%user% Process [%Process.Name%] Started >>%access.logs%

:location_Variables
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
set Process.Name=%Process.Name.Default%

title %Keanu_NAme% %Version% Process [%Process.Name%]
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@LOCATION.END@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >>%access.logs%
Echo Location Service Exiting
:EOF