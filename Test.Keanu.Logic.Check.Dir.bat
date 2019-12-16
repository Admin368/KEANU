@echo %Debug%
REM call keanu.location.bat
REM echo %keanu.date.time% User:%user% Process [Keanu.Logic.Check.Dir] Called >>%access.log% 2>1&

:Check.dir
set /p text="test: "
Dir K:\*.bat >K:\Keanu.Logic.Check.Dir.txt
type K:\Keanu.Logic.Check.Dir.txt|findstr "[%text%.bat]" >nul
if %errorlevel% equ 0 (
Echo Process Found
Echo %text%.bat Found
pause
goto :Check.Dir
)
Echo none found
pause
goto :Check.Dir