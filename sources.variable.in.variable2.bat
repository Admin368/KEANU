@echo off

:start01
set var=A
set /p var2=Choice:
echo %var2%|findstr /i "%var%" sources.variable.in.variable.test.txt
if %errorlevel%==0 (
    echo The string is found
) else (
    echo The string is not found
)

echo if exist sources.variable.in.variable.test.txt (echo True) else echo False

goto :start01

pause>nul