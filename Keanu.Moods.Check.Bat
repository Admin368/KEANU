REM 107.Studios .File Created by "CreatorMode" on "2019_10_31- 5;32_45" 
@echo %Debug%
Set Process.Name.Default=Keanu.Moods.Check.Bat 

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
set Mood=%text%

call keanu.location.bat
goto :MainFuction

:FileON




REM ################################################################################
REM Main File ONs From HERE
:MainFuction

mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\General\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "%mood%" -t Mood\General\Type




REM Remember this is for allowance of entery variation

:MOODS
REM ============END===============
echo %text%|findstr /i "End" >nul
if %errorlevel% equ 0 (
mosquitto_pub -h 192.168.1.170 -p 1883 -m "End" -t Mood\Transfer\State
REM call keanu.moods.end.bat
REM set NodeRed.Request=True
REM set Mood=End
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============01.SEXY===============
echo %text%|findstr /i "sexy" >nul
if %errorlevel% equ 0 (
Echo Launching Sexy Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Sexy
mosquitto_pub -h 192.168.1.170 -m "Sexy" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Sexy
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:02.Armageddon===============
echo %text%|findstr /i "Armageddon" >nul
if %errorlevel% equ 0 (
Echo Launching Armageddon Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Armageddon
mosquitto_pub -h 192.168.1.170 -m "Armageddon" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Armageddon
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:03.LongDay===============
echo %text%|findstr /i "LongDay" >nul
if %errorlevel% equ 0 (
Echo Launching LongDay Mood
timeout /t 1
set NodeRed.Request=True
set Mood=LongDay
mosquitto_pub -h 192.168.1.170 -m "LongDay" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\LongDay
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:04.Movie===============
echo %text%|findstr /i "Movie" >nul
if %errorlevel% equ 0 (
Echo Launching Movie Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Movie
mosquitto_pub -h 192.168.1.170 -m "Movie" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Movie
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:05.Sleeping===============
echo %text%|findstr /i "Sleeping" >nul
if %errorlevel% equ 0 (
Echo Launching Sleeping Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Sleeping
mosquitto_pub -h 192.168.1.170 -m "Sleeping" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Sleeping
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:06.Thunder===============
echo %text%|findstr /i "Thunder" >nul
if %errorlevel% equ 0 (
Echo Launching Thunder Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Thunder
mosquitto_pub -h 192.168.1.170 -m "Thunder" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Thunder
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:07.Slow===============
echo %text%|findstr /i "Slow" >nul
if %errorlevel% equ 0 (
Echo Launching Slow Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Slow
mosquitto_pub -h 192.168.1.170 -m "Slow" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Slow
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:08.BadGuy===============
echo %text%|findstr /i "BadGuy" >nul
if %errorlevel% equ 0 (
Echo Launching BadGuy Mood
timeout /t 1
set NodeRed.Request=True
set Mood=BadGuy
mosquitto_pub -h 192.168.1.170 -m "BadGuy" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\BadGuy
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:09.EDM===============
echo %text%|findstr /i "EDM" >nul
if %errorlevel% equ 0 (
Echo Launching EDM Mood
timeout /t 1
set NodeRed.Request=True
set Mood=EDM
mosquitto_pub -h 192.168.1.170 -m "EDM" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\EDM
REM call Keanu.Moods.bat>NUL
goto :EOF
)
REM ============:10.Party===============
echo %text%|findstr /i "Party" >nul
if %errorlevel% equ 0 (
Echo Launching Party Mood
timeout /t 1
set NodeRed.Request=True
set Mood=Party
mosquitto_pub -h 192.168.1.170 -m "Party" -t Mood\Transfer\State
REM mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Party
REM call Keanu.Moods.bat>NUL
goto :EOF
)









REM ============NOT SET===============
ECHO MOOD TYPE NOT SET
set Mood=None
call keanu.moods.bat
goto :Done


























































goto :EOF
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question

set /p Question.Answer=%user%:%Question.Asked%
echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
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








:Done2
set /P Sym.Done=%Done.Question%?[Yes/No/Exit]
echo %keanu.date.time% User:%user% %Done.Question% [Yes/No/Exit] = %Sym.Done% >>%access.logs% 2>1&

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
goto :Done2



:Question.Yes
Echo No Entry(if Updated is Comment This Out)
pause
goto :FileON
Echo Failed
Keanu.logic.Main.bat

:Question.No
Echo No Entry(if Updated is Comment This Out)
pause
goto :Done
Echo Failed
Keanu.logic.Main.bat


:Logic
Echo KEANU_LOGIC ONing
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
keanu.logic.bat 2>>%access.logs%

:LogicMain
Echo KEANU_LOGIC_MAin ONing
echo %keanu.date.time% calling [keanu.logic.Main.bat] >>%access.logs%
keanu.logic.Main.bat 2>>%access.logs%



:loading
call Keanu.loading.bat
Echo KEANU_LOGIC ONing
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

:Done
call keanu.logic.main.bat


:EOF