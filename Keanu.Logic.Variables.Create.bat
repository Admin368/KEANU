@echo off
Set Process.Name=keanu.logic.Variable.Create
call keanu.location.bat

:VarCreate
Echo Keanu.LogicData.Variable
echo %BotName%: What Variable Would you like to Add?
set /p VarCreate=%BotName% Variable:
set /p VarResp=%BotName% Varible Response:
goto :VariableWrite


:VariableWrite
type echo %text%|findstr /i "%VarCreate%" >nul>>Keanu.Logic.Variables.bat
Echo if %errorlevel% equ 0 (>>Keanu.Logic.Variables.bat
Echo Echo %VarResp%>>Keanu.Logic.Variables.bat
Echo goto :Done>>Keanu.Logic.Variables.bat
Echo >>Keanu.Logic.Variables.bat
echo Done
call keanu.pause