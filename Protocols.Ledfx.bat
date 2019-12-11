@echo off
Set Process.Name.Default=Protocols.Ledfx
call Keanu.location.bat

Echo Keanu : Starting LedFx Protocol
timeout /2
start protocols.ledfx_start.bat
exit

:EOF