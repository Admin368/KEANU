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
Echo Fatal Error
Echo Mount Was not Launched

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
goto :clean
:R03
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