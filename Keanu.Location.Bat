@echo %debug%
Echo Location Service starting
:Check_Mount
if /i "%Mount_Used%" equ "Yes" goto :Location

:No_Mount
goto No_Mount_New

:No_Mount_New
:Action_Mount
cls
@echo off
Echo FATAL ERROR : MOUNT NOT USED
Echo Enter "E" to Exit
Echo Enter "C" to Continue
Echo Enter "R" to Re_unmount and Mount Again
Echo enter "L" to USE LAUNCHER TO SOLVE MOUNT ERROR (RECCOMMENDED)
set /p Action_Mount=Action to Do :
if /I "%Action_Mount%" EQU "C" goto :Location
if /I "%Action_Mount%" EQU "R" goto :ReMount
if /I "%Action_Mount%" EQU "E" call Keanu.exit.bat
if /I "%Action_Mount%" EQU "L" Keanu.bat
Echo incorrect option Selected
cls
goto :Action_Mount
goto :Location

:No_Mount_old
::Error R01 :No mount
Set Error=R01
call Error_List.bat
goto :Location

:ReMount
@echo off
Echo Remounting
timeout /t 3
call unmount.bat
call Mount.bat
goto :Check_Mount

:Location
@echo %debug%
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