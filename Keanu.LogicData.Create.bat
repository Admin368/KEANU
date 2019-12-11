@echo Off
Set Process.Name=keanu.logicData.Create
call keanu.location.bat 2>>%access.logs%

rem Create the Command file if not exist
if not exist Keanu.LogicData.Commands.txt echo.>Keanu.LogicData.Commands.txt

rem Create the Speech file if not exist
if not exist Keanu.LogicData.Speech.txt echo.>Keanu.LogicData.Speech.txt

rem Create the Users file if not exist
if not exist Keanu.LogicData.Users.txt echo.>Keanu.LogicData.Users.txt

rem Create the Variables file if not exist
if not exist Keanu.LogicData.Variables.txt echo.>Keanu.LogicData.Variables.txt