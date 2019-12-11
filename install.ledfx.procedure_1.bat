@echo off
set Process.Name=Install.Ledfx.Procedure1
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure1] Was Started >>%access.logs%
call keanu.location.bat

REM conda create --name visualization-env python=3.5 2>>%access.logs%
conda create -n ledfx python=3.5 2>>%access.logs%