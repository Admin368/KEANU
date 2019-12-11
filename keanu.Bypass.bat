REM 107.Studios .File Created by "CreatorMode" on "2019_10_29-16;00_22" 
@echo on
Set Process.Name.Default=keanu.Bypass.bat 

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt

goto :MainFuction

:FileStart




REM ################################################################################
REM Main File starts From HERE
:MainFuction

Set Process.Name=Keanu.Bypass
rem call keanu.Request.Admin.bat


net use K: \\192.168.1.168\keanu >nul 2>nul
net use H: \\192.168.1.168\keanu.Heavy >nul 2>nul
K:
call keanu.date.time.bat

set Access.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Access.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"


set Access.Error= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Errors= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acess.Errors= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Acces.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Acess.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Aces.Logs\%Keanu.date.time%Fatal.txt"

set Speech.Enable=Yes
set MQTT.Request=False

call Keanu.location.bat













goto :eof
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question

set /p Question.Answer=%user%:%Question.Asked%
echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
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
set /P Sym.Done=%Done.Question%?[Yes/No/Exit]
echo %keanu.date.time% User:%user% %Done.Question% [Yes/No/Exit] = %Sym.Done% >>%access.logs% 2>1&

if /I "%Sym.Done%" EQU "Yes" goto :Keanu
if /I "%Sym.Done%" EQU "Y" goto :Keanu
if /I "%Sym.Done%" EQU "Keanu" goto :Keanu
if /I "%Sym.Done%" EQU "K" goto :Keanu
if /I "%Sym.Done%" EQU "No" goto :Question
if /I "%Sym.Done%" EQU "N" goto :Question
if /I "%Sym.Done%" EQU "E" goto :Exit
if /I "%Sym.Done%" EQU "Exit" goto :Exit
if /I "%Sym.Done%" EQU "Logic" goto :Keanu
if /I "%Sym.Done%" EQU "L" goto :Keanu
cls
goto :Done



:Question.Yes
Echo No Entry(if Updated is Comment This Out)
pause
goto :FileStart
Echo Failed
Keanu.logic.Main.bat

:Question.No
Echo No Entry(if Updated is Comment This Out)
pause
goto :Done
Echo Failed
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
Echo Process [%Process.Name%] Main Function Successful >>%acesslogs%
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
Set ErrorFile=K:\keanu.Access.Errors\%ErrorName%.txt
type %Errorlog% >%ErrorFile%
Echo Process [%Process.Name%] Was NOT Successful
type %Errorlog%
pause
goto :Done



:EOF