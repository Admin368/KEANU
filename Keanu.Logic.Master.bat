@echo %Debug%
Set Process.Name=keanu.logic.Master
call keanu.location.bat
echo Process [Keanu.Logic.Master] %user% %keanu.date% %keanu.time% >>%access.logs% 2>&1

call Keanu.Logic.Main.Start.bat