@echo %Debug%
Set Process.Name.Default=Protocols.Ledfx
REM call keanu.location.bat

Echo Starting LEDFX
conda activate ledfx && ledfx --open-ui
