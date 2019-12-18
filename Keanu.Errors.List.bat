@echo %Debug%
cls
set check_once=No


:Error_check
echo %Error_list%|findstr "R" >nul 2>nul
if %errorlevel% equ 0 (
Echo %Keanu_Name%_Error: %Error_List%
goto :%error_list%
goto :No_error
pause
goto :clean
)
goto :Recheck

:Error_List

:R01
Set Error_Reason=Mount Was not Launched
echo Fatal Error %error_list%  %Error_Reason% >>%Access.logs%
echo Fatal Error %error_list%  %Error_Reason% >>%Access.Errors%
set reply=Fatal Error
call reply.bat
set reply=%Error_Reason%
call reply.bat
set /p run_mount=Would you Like to run Mount?(Yes / No) =
echo %run_mount%|findstr /i "Y" 
if %errorlevel% equ 0 (
color 1a
call Mount.bat
call Keanu.bat
)
Echo No Solution Selected
closing %Keanu_Name%
pause
exit
goto :Clean

:R02
Set Error_Reason=Error Launcher Crashed
echo Fatal Error %error_list%  %Error_Reason% >>%Access.logs%
echo Fatal Error %error_list%  %Error_Reason% >>%Access.Errors%
set reply=%Error_Reason%
call reply.bat
pause
goto :clean


:R03
Set Error_Reason=Error Keanu Logic is obselete
echo Fatal Error %error_list%  %Error_Reason% >>%Access.logs%
echo Fatal Error %error_list%  %Error_Reason% >>%Access.Errors%
Set reply=%Error_Reason%
call reply.bat
:R03_Q
Echo Press Y to use a new Launcher
Echo Press N to close
Set /p Action=Select action Y/N :
if /I %Action%=="Y" goto :R03_Y
if /I %Action%=="N" goto :R03_N
cls
goto :R03_Q
:R03_Y
Keanu.bat
:R03_N
keanu.exit.bat
goto :clean



:R04
goto :clean 

:Recheck
if %Check_Once%==Yes goto :EOF
set check_once=Yes

echo %Errorlist%|findstr "R" >nul 2>nul
if %errorlevel% equ 0 (
set Error_List=%Errorlist%
goto :Error_check
)
echo %Error.list%|findstr "R" >nul 2>nul
if %errorlevel% equ 0 (
set Error_List=%Error.list%
goto :Error_check
)
echo %Error%|findstr "R" >nul 2>nul
if %errorlevel% equ 0 (
set Error_List=%Error%
goto :Error_check
)
goto :No_error



:No_error
Echo No Such Error Was Found
Pause
goto :clean

:Clean
Set Error_List=None
Set Errorlist=None
Set Error.list=None
Set Error=None
goto :EOF

:EOF