@echo %Debug%
call Keanu.location.bat

:loop
set /p answer=Guess?
if %answer% == what goto :correct
if not %answer% == what goto :Wrong
goto :loop


:correct
echo "dope,Matched"
goto :loop

:Wrong
echo "sad ,no Match"
goto :loop