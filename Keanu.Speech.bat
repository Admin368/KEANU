REM 107.Studios .File Created by "CreatorMode" on "2019_10_17-14;24_10" 
@echo %Debug% 
Set Process.Name.Default=Keanu.Speech.bat 
Rem Error Margin 
Echo [Keanu.Speech.bat] starting here 
@echo %Debug%

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=What Would you like me to say with my Voice?["Exit" to Exit]
Set Done.Question=Should i Close My Speech Process [Yes/No]
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
set Speech.Enable=Yes

call keanu.location.bat
goto :Question

:FileStart




REM ################################################################################
REM Main File starts From HERE
:MainFuction


goto :successCheck
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question
set Speech.text=Hello, %User% %Question.Asked%
call Keanu.Speech.Engine.bat
set /p Question.Answer=%user%:%Question.Asked%
echo %keanu.date.time% User:%user% Requested [Keanu.Speech] to Say %Question.Answer% >>%access.logs%
if /I "%Question.Answer%" EQU "Exit" goto goto :Done
if /I "%Question.Answer%" EQU "E" goto goto :Done
if /I "%Question.Answer%" EQU "Keanu" goto :Keanu
if /I "%Question.Answer%" EQU "K" goto :Keanu
if /I "%Question.Answer%" EQU "Logic" goto :Keanu
if /I "%Question.Answer%" EQU "L" goto :Keanu
set Speech.text=%Question.Answer%
call Keanu.Speech.Engine.bat
cls
goto :Question

:Done
set Speech.text=%Done.Question%
call Keanu.Speech.Engine.bat
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
set Speech.text=Good Bye
call Keanu.Speech.Engine.bat
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo Exiting
echo %keanu.date.time% User:%user% calling [Exit.Keanu.bat] >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat


:Keanu
set Speech.text=Good bye
call Keanu.Speech.Engine.bat
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo going back to keanu
Timeout /t 1
echo %keanu.date.time% User:%user% calling [Keanu.bat] >>%access.logs% 2>1&
set Speech.Enable=False
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