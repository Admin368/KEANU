@echo %Debug%
set Logic_Caller=%Process.name%
Set Process.Name=keanu.logic
call Keanu.location.bat
:Error
set Error_list=R03
call Error_list.bat
goto Keanu.Exit


