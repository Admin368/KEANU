@echo %Debug%
set Process.Name=Install.Ledfx.Procedure5
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure5] Was Started >>%access.logs%
call keanu.location.bat

pip install pyqtgraph 2>>%access.logs%