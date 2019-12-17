@echo %Debug%
set Process.Name=Install.Ledfx.Procedure7
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure7] Was Started >>%access.logs%
call keanu.location.bat

pip install pyaudio 2>>%access.logs%