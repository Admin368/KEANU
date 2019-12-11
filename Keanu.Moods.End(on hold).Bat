REM 107.Studios .File Created by "CreatorMode" on "2019_10_28-22;35_54" 
@echo off 
Set Process.Name.Default=Keanu.Moods.End.Bat 


set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=?[Yes/No]
Set Done.Question=Are You Done?[Yes/No]
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt

call keanu.location.bat
goto :MainFuction

:FileStop




REM ################################################################################
REM Main File Stops From HERE
:MainFuction
Echo Ending Mood
set NodeRed.Request=False
taskkill /F /IM "vlc.exe"
echo %keanu.date.time% User:%user% %Mood% Ended >>%access.logs%
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Sexy\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Armageddon\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\LongDay\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Movie\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Sleeping\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Thunder\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\Slow\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\BadGuy\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Stop" -t Mood\General\State




set NodeRed.Request=True
set Mood=End Mood
REM call keanu.Moods.End.Bat
Echo SET NodeRedRequest=%NodeRed.Request%>K:\Keanu.Transfer\Transfer.bat
Echo SET TEXT=%MOOD%>>K:\Keanu.Transfer\Transfer.bat
Echo Call KEANU.BYPASS>>K:\Keanu.Transfer\Transfer.bat
Echo Call Keanu.Moods.Check.bat>>K:\Keanu.Transfer\Transfer.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "ON" -t Mood\Transfer\State


REM SETX NodeRedRequest "False"
REM SETX Text "None"
REM SETX Mood "None"

SET NodeRedRequest=Node
SET Mood=None
SET TEXT=None


goto :EOF
goto :successCheck
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question

set /p Question.Answer=%user%:%Question.Asked%
echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs%
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
goto :FileStop
Echo Failed
Keanu.logic.Main.bat

:Question.No
Echo No Entry(if Updated is Comment This Out)
pause
goto :Done
Echo Failed
Keanu.logic.Main.bat


:Logic
Echo KEANU_LOGIC Stoping
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
keanu.logic.bat 2>>%access.logs%

:LogicMain
Echo KEANU_LOGIC_MAin Stoping
echo %keanu.date.time% calling [keanu.logic.Main.bat] >>%access.logs%
keanu.logic.Main.bat 2>>%access.logs%



:loading
call Keanu.loading.bat
Echo KEANU_LOGIC Stoping
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