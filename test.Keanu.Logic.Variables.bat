@echo %Debug%
goto :068

:Done
call keanu.logic.main.bat



:068
set /p text="test: "
echo %text%|findstr "love" >nul
if %errorlevel% equ 0 (
echo Dont fall in Love with me baby
goto :068
)
echo %text%|findstr "hate" >nul
if %errorlevel% equ 0 (
echo i hate you too
goto :068
)
echo %text%|findstr "like" >nul
if %errorlevel% equ 0 (
echo i dont like you either
goto :068
)
echo %text%|findstr "sleep" >nul
if %errorlevel% equ 0 (
echo go and sleep
goto :068
)
echo %text%|findstr "switch" >nul
if %errorlevel% equ 0 (
echo what should is switch on?
goto :068
)
echo %text%|findstr "on" >nul
if %errorlevel% equ 0 (
echo go and sleep
goto :068
)
echo not found
goto :068