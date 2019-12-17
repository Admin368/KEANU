@echo %Debug%
Set Process.Name=keanu.Logic.Check.Dir
call keanu.location.bat
goto :Run.Dir

:Check.dir
Dir K:\*.bat >K:\Keanu.Logic.Check.Dir.txt
type K:\Keanu.Logic.Check.Dir.txt|findstr /i "%text%" >nul
if %errorlevel% equ 0 (
goto :Run.Dir


:Run.Dir
call %text%.bat 2>nul && call keanu.logic.main

call %text% 2>nul && call keanu.logic.main
)
echo %keanu.date.time% User:%user% [Keanu.logic.Check.Dir] No Dir Match Found >>%access.logs%