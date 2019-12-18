@echo off
cd /d C:\keanu.config
set /p Local_Dir=<C:\Keanu.Config\Local_dir.txt
subst K: /D >nul 2>nul
subst K: %Local_dir%
REM cd /D %Local_dir%
cd /D K:\
Echo Keanu.Launcher 2019
Set /P App=Keanu App to Launch ? :
call %App%