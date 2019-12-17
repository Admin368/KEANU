@echo %Debug%
Set Process.Name=keanu.logicMaster.bat
set
call Keanu.location.bat
Echo %Keanu.date.time% User:CreatorMode Running [Keanu.LogicMaster] >>%access.log%

Set /P User=<Keanu.Adm.txt
cls 
call keanu.logo.bat
call keanu.version.bat
keanu.logic.main.bat