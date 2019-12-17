@echo %Debug%
Set Process.Name.Default=Protocols.aubio
call Keanu.location.bat

Echo Keanu : Starting LedFx Protocol
pause
:start01
set /P c=Which WLed Chip Shuld be Affected ? ("L" to list your options)
if /I "%c%" EQU "L" goto :list
if /I "%c%" EQU "List" goto :list
if /I "%c%" EQU "Wled1" goto :Wled1
if /I "%c%" EQU "1" goto :Wled1
if /I "%c%" EQU "Wled2" goto :Wled2
if /I "%c%" EQU "2" goto :Wled1
goto :start01


:List
Echo 1 for WLed1
Echo 2 for WLed2
goto :start01

:Wled1
echo starting Protocol
echo Keanu.Protocols.Aubio.Wled1
start protocols.aubio.wled1.bat

:Wled1
echo starting Protocol
echo Keanu.Protocols.Aubio.Wled2
start protocols.aubio.wled2.bat