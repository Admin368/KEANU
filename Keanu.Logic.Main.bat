@echo %Debug%
Set Process.Name=keanu.logic.Main
call keanu.location.bat
echo %keanu.date.time% User:%user% started [Keanu.Logic.Main] >>%access.logs%
goto :001564

:001564
color 17
Echo [%botname%] "Clear"  to clear conversion
set /p text="%user%: "
echo %keanu.date.time% User:%user% Logic entered:%text% >>%access.logs% 2>&1
keanu.logic.Check.bat
goto :001564
pause