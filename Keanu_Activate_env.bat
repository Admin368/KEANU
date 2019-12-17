@echo %Debug%
:start
call mount.bat
net use J: \\192.168.1.168\keanu\Projects\Django.Dev >nul 2>nul
J:
REM cd Proj_Env
echo list of available env
REM dir *Proj* 2>nul
dir *Env*  2>nul
dir *env*  2>nul
echo dont write _env
echo just write proj name env
set /P Env=Which Env do you activate :

:Proj_Deploy
set Full.Env=J:\%Env%_Env
cd %Full.Env% 2>nul
if %errorlevel% equ 0 (
goto :Script
)
if %errorlevel% equ 1 (
Echo not found
Echo Or You added "_env"
set Full.Env=J:\%Env%
cd %Full.Env% 2>nul
if %errorlevel% equ 0 (
goto :Script
)
if %errorlevel% equ 1 (
cls
timeout /3
echo no Env found
cls
goto :Start
)
)

:Script
cd scripts
call activate.bat
call activate
cls
cd J:\
set Proj_Env=J:\%Env%_Main
cd %Proj_Env%
if %errorlevel% equ 1 (
cd J:\
)
cls
REM cd %Full.Env%