REM 107.Studios .File Created by "CreatorMode" on "2019_10_17- 6;47_53" 
@echo off 
Set Process.Name.Default=Keanu.NodeRed.Install.bat 
Rem Error Margin 
Echo [Keanu.NodeRed.Install.bat] starting here 
@echo Off


set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=Wuld you linke to install Node-Red?[Yes/No]
Set Done.Question=Are You Done?[Yes/No]
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt

call keanu.location.bat
goto :Question

:FileStart
goto :MainFuction



REM ################################################################################
REM Main File starts From HERE
:MainFuction
Echo installing NodeJS
start K:\Softwares\node-v10.16.3-x64.msi 2>>%access.logs%

Echo Finish installing Then Continue
msg * Finish installing Then Continue
pause

Echo Installing Node-RED JS Script
@echo on
npm install -g --unsafe-perm node-red 2>>%access.logs%
@echo off
pause

Echo Installing Node-RED Dependencies
@echo off
cd K:\Keanu.Prog.data\nssm-2.24\nssm-2.24\win64 2>>%access.logs%
start K:\Keanu.Prog.data\nssm-2.24\nssm-2.24\win64\nssm.exe 2>>%access.logs%
pause

Echo Configuring Startup Process
cd K:\Keanu.Prog.data\nssm-2.24\nssm-2.24\win64 2>>%access.logs%
mkdir c:\temp
@echo on
nssm install Node-RED "c:\Users\\"%USERNAME%"\AppData\Roaming\npm\node-red.cmd" 2>>%access.logs%
nssm set Node-RED AppDirectory "c:\Users\\"%USERNAME%"\.node-red" 2>>%access.logs%
nssm set Node-RED AppParameters "-u c:\Users\\"%USERNAME%"\.node-red > c:\temp\node-red.log" 2>>%access.logs%
nssm set Node-RED Description "Keanu Node-Red" 2>>%access.logs%
@echo off
Echo Configurations Done
Pause

Echo Opening GUI config
Echo Please Check if info is correct
pause
nssm edit Node-RED
Echo Restart Your PC to See Changes
msg * Restart Your PC to See Changes
pause

goto :Done
goto :Keanu
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
set /P Sym.Done=%Done.Question%?[Yes/No/Exit]
echo %keanu.date.time% User:%user% %Done.Question% [Yes/No/Exit] = %Sym.Done% 2>>%access.logs% 2>1&

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