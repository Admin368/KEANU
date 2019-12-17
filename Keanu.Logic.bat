@echo %Debug%
Set Process.Name=keanu.logic
set
call Keanu.location.bat
REM call keanu.request.admin.bat



set BotName=K.E.A.N.U

title %BotName%-ConvoMode
color 0b

echo %keanu.date.time% User:%user% calling [keanu.logicData.create] >>%access.logs%
call keanu.logicData.create.bat


Echo staring %BotName% ConvoMode
call keanu.pause

cls

:Name




:: DYNAMIC QUESTIONS THAT PULL REALTIME INFORMATION
if /i "%NU%"=="What time is it?" goto :TIME
s
:: OUR SPEECH FILE
for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Users.txt) do (

if /i "%NU%"=="%%a" (
Set reply=Already Exists
call reply.bat
goto :Name
)
)
set /p answer=%BotName%: Your Welcome Message?
echo %NU%{echo %answer%>>Keanu.LogicData.Users.txt
Set reply=Thanks! USer %answer% Registered
call reply.bat
goto :Name

:WELCOME
::call keanu.logo.bat
set reply=Fuck you %user% ,what can I Do for You?
call reply.bat
goto :Logic.start



:OwnName
echo that your own name
echo.
goto :Logic.start


:Logic.start
echo %keanu.date.time% User:%user% calling [keanu.logic.Main.Start] >>%access.logs%
keanu.logic.Main.Start.bat 2>>%access.logs%

