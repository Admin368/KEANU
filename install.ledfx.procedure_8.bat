@echo %Debug%
set Process.Name=Install.Ledfx.Procedure8
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx.Procedure8] Was Started >>%access.logs%
call keanu.location.bat

pipwin install pyaudio 2>>%access.logs%
conda config --add channels conda-forge 2>>%access.logs%
conda install aubio portaudio pywin32 2>>%access.logs%
pip install ledfx 2>>%access.logs%