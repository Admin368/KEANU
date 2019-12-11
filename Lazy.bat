@echo off
Set Process.Name.Default=Keanu.Lazy
call Keanu.location.bat


goto :01

:01
cls
Echo #####>K>E>A>N>U--L<A<Z<Y--M>O>D>E!###
call keanu.version.bat
type lazy.txt
goto :loop

:loop
color 17
set /p Lazy="LazyCode: "

:: OUR SPEECH FILE
REM for /f "tokens=1,* delims={" %%a in (lazy.txt) do (
for /f "tokens=1,* delims={" %%a in (Keanu.LogicData.Commands.txt) do (
if /i "%Lazy%"=="%%a" (
%%b
echo CheatCode Accepted You Lazy Ass
pause
cls
goto :01
)
)
color 14
echo %BotName%: No Such Lazy Code.
echo %BotName%: Try Again!
timeout /t 3
cls
goto :01
