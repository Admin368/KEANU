::Set Debug=On
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
Echo Service : Location.bat
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

if /i "%Run_Once%" equ "Yes" goto :Location_Main
goto :Run_Once_Code
:Run_Once_Code
set Run_Once=Yes
:: put any commands you wanna run once here
:Run_Once_01
::Run_Once_01_FullScreen
:FullScreen
cls
if /i "%FullScreen%" equ "Yes" goto :FullScreen_On
goto :FullScreen_Off
:FullScreen_On
cls
echo %keanu.date.time% Adjusting View To Full Screen >>%access.logs%
cls
REM mode con lines=32766
Echo %keanu.date.time% User:%user% Support_Process [Keanu.FullScreen] Was Called by [Keanu.Main]>>%access.logs%
call FULLSCREEN.BAT
REM mode con:cols=80 lines=100
goto :Run_Once_02
:FullScreen_Off
echo %keanu.date.time% Full Screen Option in config was "off" >>%access.logs%
goto :Run_Once_02

:Run_Once_02
::Run_Once_02_



:Run_Once_End
::END_OF_RUNONCE
goto :Location_Main


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