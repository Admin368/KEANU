@echo off
set Process.Name=Install.KTS_telnet.bat
call Keanu.location.bat

daemon.exe -install
daemon.exe -start
daemon.exe -rsakey
"KTS home.url"
