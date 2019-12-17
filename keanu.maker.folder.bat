Echo [keanu.maker.folder] starting here 
@echo %Debug%
Set Process.Name=keanu.Maker.Folder
call keanu.location.bat 
Echo No Code Yet (if Updated is Comment This Out)
pause
Keanu.logic.Main.bat

set Question.Asked=?[Yes/No]










:Question

set /p Question.Answer=%Question.Asked%
Rem echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
if /I %Question.Answer% EQU "Yes" goto :Question.Yes
if /I %Question.Answer% EQU "Y" goto :Question.Yes
if /I %Question.Answer% EQU "No" goto :Question.No
if /I %Question.Answer% EQU "N" goto :Question.No
if /I %Question.Answer% EQU "Exit" goto :Exit
if /I %Question.Answer% EQU "E" goto :Exit
if /I %Question.Answer% EQU "Keanu" goto :Keanu
if /I %Question.Answer% EQU "K" goto :Keanu
if /I %Question.Answer% EQU "Logic" goto :Keanu
if /I %Question.Answer% EQU "L" goto :Keanu
cls
goto :Question

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
echo Exiting
echo %keanu.date.time% User:%user% calling [Exit.Keanu.bat] >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat


:Keanu
echo going back to keanu
Timeout /t 1
echo %keanu.date.time% User:%user% calling [Keanu.bat] >>%access.logs% 2>1&
cls
Keanu.Logic.Main.bat


:EOF