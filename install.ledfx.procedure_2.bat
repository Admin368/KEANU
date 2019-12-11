@echo off
set Process.Name=Install.Ledfx.Procedure2
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure2] Was Started >>%access.logs%
call keanu.location.bat

REM activate visualization-env 2>>%access.logs%
conda activate ledfx 2>>%access.logs%