@echo off
set Process.Name=Install.Ledfx.Procedure4
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure4] Was Started >>%access.logs%
call keanu.location.bat

pip install scipy 2>>%access.logs%