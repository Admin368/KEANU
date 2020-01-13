@echo off
:Unmount
subst
Subst >Mounted.txt
type Mounted.txt|findstr "K:"
if %errorlevel% equ 0 (
subst K: /d
)
goto :Launch_Main

:Launch_Main
cd /d C:\keanu.config
set /p Local_Dir=<C:\Keanu.Config\Local_dir.txt
subst K: %Local_dir%
REM cd /D %Local_dir%
cd /D K:\
Echo Keanu.Launcher 2019
Set /P App=Keanu App to Launch ? :
call %App%