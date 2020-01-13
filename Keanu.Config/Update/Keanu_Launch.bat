@echo off
:Unmount
subst
Subst >Mounted.txt
type Mounted.txt|findstr "K:"
if %errorlevel% equ 0 (
subst K: /d
)
del /f /q Mounted.txt
goto :Launch_Main


:Launch_Main
cd /d C:\keanu.config
set /p Local_Dir=<C:\Keanu.Config\Local_dir.txt
subst K: %Local_dir%
REM cd /D %Local_dir%
cd /D K:\
cls
Echo     KEANU_V5
Echo Keanu.Launcher_ 2020
Echo Note From Keanu_V5
Echo start with Keanu_Launch
Echo To Start Keanu
Echo Keanu Voice now in V5
Echo Enter "Keanu" to launch Main Keanu System
Set /P App=Keanu App to Launch ? :
call %App%