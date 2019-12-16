@echo %Debug%
Set Process.Name=keanu.Speech.Random
call Keanu.location.bat


setlocal enabledelayedexpansion

set string[0]=bye %name%.
set string[1]=Good Day %name%.
set string[2]=later %name%.
set /a idx=%random% %%3
echo !string[%idx%]!