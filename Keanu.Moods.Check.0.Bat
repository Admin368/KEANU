@echo off
Set Process.Name.Default=Keanu.Moods.Check.0Bat
set Process.Name=%Process.Name.Default%
goto :Pre.Check


:done
goto :EOF

:Pre.Check
REM ============END===============
echo %text%|findstr /i "End" >nul
if %errorlevel% equ 0 (
REM
goto :Done
)
echo %text%|findstr /i "Stop" >nul
if %errorlevel% equ 0 (
REM
goto :Done
)
REM ============01.SEXY===============
echo %text%|findstr /i "sexy" >nul
if %errorlevel% equ 0 (
set reply=Starting Sexy Mood
call reply.bat
REM timet /t 1
set NodeRed.Request=True
set Mood=Sexy
REM
goto :Done
)
REM ============:02.Armageddon===============
echo %text%|findstr /i "Armageddon" >nul
if %errorlevel% equ 0 (
set reply=Armageddon Mood
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=Armageddon
REM
goto :Done
)
echo %text%|findstr /i "Chaos" >nul
if %errorlevel% equ 0 (
set reply=Armageddon Mode
call reply.bat
REM timet /t 3
Set Text=Armageddon Mood
set NodeRed.Request=True
set Mood=Armageddon
REM
goto :Done
)
REM ============:03.LongDay===============
echo %text%|findstr /i "LongDay" >nul
if %errorlevel% equ 0 (
set reply=Launching LongDay Mood
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=LongDay
REM
goto :Done
)
REM ============:04.Movie===============
echo %text%|findstr /i "Movie" >nul
if %errorlevel% equ 0 (
set reply=Launching Movie Mood
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=Movie
REM
goto :Done
)
REM ============:05.Sleeping===============
echo %text%|findstr /i "Sleeping" >nul
if %errorlevel% equ 0 (
set reply=Launching Sleeping Mode
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=Sleeping
REM
goto :Done
)
REM ============:06.Thunder===============
echo %text%|findstr /i "Thunder" >nul
if %errorlevel% equ 0 (
set reply=Launching Thunder Mode
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=Thunder
REM
goto :Done
)
REM ============:07.Slow===============
echo %text%|findstr /i "Slow" >nul
if %errorlevel% equ 0 (
set reply=Launching Slow Mood
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=Slow
REM
goto :Done
)
REM ============:08.BadGuy===============
echo %text%|findstr /i "BadGuy" >nul
if %errorlevel% equ 0 (
set reply=Launching BadGuy Mode
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=BadGuy
REM
goto :Done
)
REM ============:09.EDM===============
echo %text%|findstr /i "EDM" >nul
if %errorlevel% equ 0 (
set reply=Launching EDM Mode
call reply.bat
REM timet /t 3
set NodeRed.Request=True
set Mood=EDM
REM
goto :Done
)
REM ============:10.Party===============
echo %text%|findstr /i "Party" >nul
if %errorlevel% equ 0 (
set reply=Launching Party Mode
call reply.bat
REM timet /t 4
set NodeRed.Request=True
set Mood=Party
REM
goto :Done
)
echo %text%|findstr /i "Special" >nul
if %errorlevel% equ 0 (
set reply=Calling Force Command
call reply.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "%text%" -t Mood\Transfer\State
goto :Done
)
echo %text%|findstr /i "Force" >nul
if %errorlevel% equ 0 (
set reply=Calling Force Command
call reply.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "%text%" -t Mood\Transfer\State
goto :Done
)
REM ============NOT SET===============
ECHO MOOD TYPE NOT SET
set NodeRed.Request=False
set Mood=None
call keanu.moods.bat
goto :Done

:EOF