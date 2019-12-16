@echo %Debug%
Set Process.Name=keanu.Speech.Writer
call keanu.location.bat
call Keanu.LogicData.Create.bat

:Start
color 0b
Echo Keanu Speech Writer %version%
set /p text="Speech: "

if /i "%text%"=="What time is it?" goto :TIME
if /i "%text%"=="What is the time?" goto :TIME
if /i "%text%"=="What is the date?" goto :DATE

for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Speech.txt) do (

if /i "%text%"=="%%a" (
%%b
pause
cls
goto :START
)
)
color 14
echo Response Not Found
echo how should the following :
echo %text%
set /p answer=%BotName%: be answered?
echo %text%{echo %answer%>>Keanu.LogicData.Speech.txt
echo %BotName%: Thanks!
call keanu.pause
cls
goto :START