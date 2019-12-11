@echo off
set var=A
set /p var2=Choice:
echo %var2%|findstr /i "%var%" > sources.variable.in.variable.test.txt
if exist sources.variable.in.variable.test.txt (echo True) else echo False
pause>nul