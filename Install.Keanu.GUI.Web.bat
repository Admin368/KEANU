REM Echo [Keanu.GUI.Web.Install] starting here 
@echo Off
set Process.Name=Install.Keanu.GUI.Web
call keanu.location.bat
Echo No Code Yet (if Updated is Comment This Out)
pause
Keanu.logic.Main.bat

set Process.Name=Install.Keanu.GUI.Web
set Question.Asked=Wuld you like to install Keanu.Web GUI?[Yes/No]










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
Echo setting necessesary configurations
Echo 192.168.1.100 Keanu>>C:\Windows\System32\drivers\etc\hosts
Echo 192.168.1.168 Server68>>C:\Windows\System32\drivers\etc\hosts
Echo 192.168.1.168 107Network.local>>C:\Windows\System32\drivers\etc\hosts
Echo 192.168.1.166 xClient>>C:\Windows\System32\drivers\etc\hosts
Echo 192.168.1.100 Xpi>>C:\Windows\System32\drivers\etc\hosts
Echo 192.168.1.100 Keanu>>C:\Windows\System32\drivers\etc\hosts

call 

:Question.No
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

:Done
set /p Done.Answer=%Done.Asked%
Rem echo %keanu.date.time% User:%user% Wuld You like To Launch Keanu.GUI.Web = %Done.Answer% >>%access.logs% 2>1&
if /I %Done.Answer% EQU "Yes" goto :Done.Yes
if /I %Done.Answer% EQU "Y" goto :Done.Yes
if /I %Done.Answer% EQU "No" goto :Keanu
if /I %Done.Answer% EQU "N" goto :Keanu
if /I %Done.Answer% EQU "Exit" goto :Exit
if /I %Done.Answer% EQU "E" goto :Exit
if /I %Done.Answer% EQU "Keanu" goto :Keanu
if /I %Done.Answer% EQU "K" goto :Keanu
if /I %Done.Answer% EQU "Logic" goto :Keanu
if /I %Done.Answer% EQU "L" goto :Keanu
cls
goto :Done

:Done.Yes
Echo Calling Keanu.GUI.Web
call Keanu.GUI.Web.bat
goto :Keanu

:EOF