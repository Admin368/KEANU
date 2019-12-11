REM 107.Studios .File Created by "CreatorMode" on "2019_10_16- 6;37_44" 
@echo off 
Echo [keanu.Error.Checker] starting here 
@echo Off
call keanu.location.bat 1>nul 2>>&1
Echo No Code Yet (if Updated is Comment This Out)
pause
Keanu.logic.Main.bat

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=?[Yes/No]
Set Done.Question=Are You Done?
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.txt

goto :FileStart

:FileStart




REM ################################################################################
REM Main File starts From HERE
:MainFuction


goto :successCheck
goto :Done
goto :FileStart
REM Main File Ends HERE
REM ################################################################################


:Question

set /p Question.Answer=%user%:%Question.Asked%
Rem echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
if /I "%Question.Answer%" EQU "Yes" goto :Question.Yes
if /I "%Question.Answer%" EQU "Y" goto :Question.Yes
if /I "%Question.Answer%" EQU "No" goto :Question.No
if /I "%Question.Answer%" EQU "N" goto :Question.No
if /I "%Question.Answer%" EQU "Exit" goto :Exit
if /I "%Question.Answer%" EQU "E" goto :Exit
if /I "%Question.Answer%" EQU "Keanu" goto :Keanu
if /I "%Question.Answer%" EQU "K" goto :Keanu
if /I "%Question.Answer%" EQU "Logic" goto :Keanu
if /I "%Question.Answer%" EQU "L" goto :Keanu
cls
goto :Question

:Done
set /P Sym.Done=sym.Link Making Done?[Yes/No/Exit]
echo %keanu.date.time% User:%user% %Done.Question% [Yes/No/Exit] = %Sym.Done% >>%access.logs% 2>1&

if /I "%Sym.Done%" EQU "Yes" goto :Keanu
if /I "%Sym.Done%" EQU "Y" goto :Keanu
if /I "%Sym.Done%" EQU "Keanu" goto :Keanu
if /I "%Sym.Done%" EQU "K" goto :Keanu
if /I "%Sym.Done%" EQU "No" goto :MainFuction
if /I "%Sym.Done%" EQU "N" goto :MainFuction
if /I "%Sym.Done%" EQU "E" goto :Exit
if /I "%Sym.Done%" EQU "Exit" goto :Exit
if /I "%Sym.Done%" EQU "Logic" goto :Keanu
if /I "%Sym.Done%" EQU "L" goto :Keanu
cls
goto :Done



:Question.Yes
Echo No Entry(if Updated is Comment This Out)
pause
Keanu.logic.Main.bat

:Question.No
Echo No Entry(if Updated is Comment This Out)
pause
Keanu.logic.Main.bat


:Logic
Echo KEANU_LOGIC starting
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
keanu.logic.bat 2>>%access.logs%

:LogicMain
Echo KEANU_LOGIC_MAin starting
echo %keanu.date.time% calling [keanu.logic.Main.bat] >>%access.logs%
keanu.logic.Main.bat 2>>%access.logs%



:loading
call Keanu.loading.bat
Echo KEANU_LOGIC starting
call keanu.logic.bat 2>>%access.logs%


:Exit
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo Exiting
echo %keanu.date.time% User:%user% calling [Exit.Keanu.bat] >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat


:Keanu
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo going back to keanu
Timeout /t 1
echo %keanu.date.time% User:%user% calling [Keanu.bat] >>%access.logs% 2>1&
cls
Keanu.Logic.Main.bat


:SuccessCheck
if %errorlevel% EQU "0" (
Echo Process [%Process.Name%] Successful
)
if %errorlevel% EQU "1" (
goto :ErrorLog
)
goto :Done

:ErrorLog
Echo Above is the Error Log for [%Process.Name%] Process >>%Errorlog%
Echo Error Source  [%Process.Name%] >>%Errorlog%
Echo Error Time %keanu.date.time% >>%Errorlog%
type %Errorlog% >>%acesslogs%
Set ErrorName=%Keanu.date.time%ErrorFor%Process.Name%
Set ErrorFile=K:\keanu.Access.Errors\%ErrorName%
type %Errorlog% >%ErrorFile%
type %Errorlog% >K:\keanu.Access.Errors\%Keanu.date.time%ErrorFor%Process.Name%.txt
Echo Process [%Process.Name%] Was NOT Successful
type %Errorlog%
pause
goto :Done



:EOF