REM 107.Studios .File Created by "CreatorMode" on "2019_10_28-19;35_20" 
@echo %Debug%

Echo Phase01==============================================================

Set Process.Name.Default=Keanu.Moods.bat 

Echo Phase02==============================================================

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=What Mood Would You like to Turn ON?
Set Done.Question=Are You Done Playing your Mood?[Yes/No]
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt


Echo Phase03==============================================================

goto :Check.Request
call keanu.location.bat

Echo Phase04==============================================================

:Check.Request
REM checking Nodered Request
if /I "%NodeRed.Request%" EQU "Yes" (
goto :NodeRed.Request
)
if /I "%NodeRed.Request%" EQU "True" (
goto :NodeRed.Request
)
if /I "%NodeRed.Request%" EQU "False" (
goto :Question
)
goto :FileON


Echo Phase05==============================================================

:FileON
goto :Question

Echo Phase06==============================================================

:NodeRed.Request

Echo Phase07==============================================================
goto :Mood.Check

:Mood.Check

Echo Phase08==============================================================
if /I "%Mood%" EQU "End" (
goto :End
)
if /I "%Mood%" EQU "Stop" (
goto :End
)
if /I "%Mood%" EQU "Sexy" (
goto :01.Sexy
)
if /I "%Mood%" EQU "Armageddon" (
goto :02.Armageddon
)
if /I "%Mood%" EQU "LongDay" (
goto :03.LongDay
)
if /I "%Mood%" EQU "Movie" (
goto :04.Movie
)
if /I "%Mood%" EQU "Sleeping" (
goto :05.Sleeping
)
if /I "%Mood%" EQU "Thunder" (
goto :06.Thunder
)
if /I "%Mood%" EQU "Slow" (
goto :07.Slow
)
if /I "%Mood%" EQU "BadGuy" (
goto :08.BadGuy
)
if /I "%Mood%" EQU "EDM" (
goto :09.EDM
)
if /I "%Mood%" EQU "Party" (
goto :10.Party
)
Echo Phase09==============================================================
if /I "%NodeRed.Request%" EQU "Yes" (
goto :EOF
)
if /I "%NodeRed.Request%" EQU "True" (
goto :EOF
)
if /I "%NodeRed.Request%" EQU "False" (
goto :Question
)
goto :Question








REM ################################################################################
REM Main File ONs From HERE
:MainFuction
goto :Question


:01.Sexy

Echo Phase10==============================================================
Echo Sexy mood starting
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Sexy
call START /B vlc -ZI null --play-and-exit "K:\Moods\Sexy\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done


:02.Armageddon
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Armageddon
call START /B vlc -ZI null --play-and-exit "K:\Moods\Armageddon\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:03.LongDay
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\LongDay
call START /B vlc -ZI null --play-and-exit "K:\Moods\LongDay\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done


:04.Movie
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Movie
call START /B vlc -ZI null --play-and-exit "K:\Moods\Movie\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:05.Sleeping
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Sleeping
call START /B vlc -ZI null --play-and-exit "K:\Moods\Sleeping\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:06.Thunder
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Thunder
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "Thunder" -t Mood\Thunder
call START /B vlc -ZI null --play-and-exit "K:\Moods\Thunder\Music.xspf" >nul
Rem timeout /t 05
Rem taskkill /F /IM "vlc.exe"
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:07.Slow
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Slow
call START /B vlc -ZI null --play-and-exit "K:\Moods\Slow\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done



:08.BadGuy
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\BadGuy
call START /B vlc -ZI null --play-and-exit "K:\Moods\BadGuy\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:09.EDM
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\EDM
call START /B vlc -ZI null --play-and-exit "K:\Moods\EDM\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

:10.Party
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "ON" -t Mood\Party
call START /B vlc -ZI null --play-and-exit "K:\Moods\Party\Music.xspf" >nul
echo %keanu.date.time% User:%user% %Mood% ONed >>%access.logs%
goto :Done

goto :successCheck
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question


ECHO KEANU.MOOD
ECHO SELECT THE MOODS BELOW
Echo End  to End Running Mood
ECHO :01.Sexy
ECHO :02.Armageddon
ECHO :03.LongDay
ECHO :04.Movie
ECHO :05.Sleeping
ECHO :06.Thunder
ECHO :07.Slow
ECHO :08.BadGuy
ECHO :09.EDM
ECHO :10.Party
ECHO Enter either the number or name of the mode
ECHO Exit to Exit back to keanu
set /p Question.Answer=%user%:%Question.Asked%
REM echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
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
if /I "%Question.Answer%" EQU "End" goto :End
if /I "%Question.Answer%" EQU "End Mood" goto :End
if /I "%Question.Answer%" EQU "OFF Mood" goto :End
if /I "%Question.Answer%" EQU "OFF" goto :End
if /I "%Question.Answer%" EQU "01" SET Mood=Sexy && goto :Q.Launch
if /I "%Question.Answer%" EQU "Sexy" SET Mood=Sexy && goto :Q.Launch
if /I "%Question.Answer%" EQU "02" SET Mood=Armageddon && goto :Q.Launch
if /I "%Question.Answer%" EQU "Armageddon" SET Mood=Armageddon && goto :Q.Launch
if /I "%Question.Answer%" EQU "03" SET Mood=LongDay && goto :Q.Launch
if /I "%Question.Answer%" EQU "LongDay" SET Mood=LongDay && goto :Q.Launch
if /I "%Question.Answer%" EQU "04" SET Mood=Movie && goto :Q.Launch
if /I "%Question.Answer%" EQU "Movie" SET Mood=Movie && goto :Q.Launch
if /I "%Question.Answer%" EQU "05" SET Mood=Sleeping && goto :Q.Launch
if /I "%Question.Answer%" EQU "Sleeping" SET Mood=Sleeping && goto :Q.Launch
if /I "%Question.Answer%" EQU "06" SET Mood=Thunder && goto :Q.Launch
if /I "%Question.Answer%" EQU "Thunder" SET Mood=Thunder && goto :Q.Launch
if /I "%Question.Answer%" EQU "07" SET Mood=Slow && goto :Q.Launch
if /I "%Question.Answer%" EQU "Slow" SET Mood=Slow && goto :Q.Launch
if /I "%Question.Answer%" EQU "08" SET Mood=BadGuy && goto :Q.Launch
if /I "%Question.Answer%" EQU "BadGuy" SET Mood=BadGuy && goto :Q.Launch
if /I "%Question.Answer%" EQU "09" SET Mood=EDM && goto :Q.Launch
if /I "%Question.Answer%" EQU "EDM" SET Mood=EDM && goto :Q.Launch
if /I "%Question.Answer%" EQU "10" SET Mood=Party && goto :Q.Launch
if /I "%Question.Answer%" EQU "Party" SET Mood=Party && goto :Q.Launch



goto :Question






:Done
if /I "%NodeRed.Request%" EQU "True" (
goto :EOF
)
if /I "%NodeRed.Request%" EQU "False" (
goto :Done.Main
)
goto :Done.Main

:Q.Launch
set NodeRed.Request=True
REM Echo taskkill /F /IM "vlc.exe">K:\Keanu.Transfer\Transfer2.bat
Echo SET NodeRedRequest=%NodeRed.Request%>K:\Keanu.Transfer\Transfer2.bat
Echo SET TEXT=%MOOD%>>K:\Keanu.Transfer\Transfer2.bat
Echo Call KEANU.BYPASS>>K:\Keanu.Transfer\Transfer2.bat
Echo Call Keanu.Moods.Check.bat>>K:\Keanu.Transfer\Transfer2.bat
Echo call K:\Keanu.Transfer\Delete.Transfer.bat>>K:\Keanu.Transfer\Transfer2.bat
mosquitto_pub -h 192.168.1.170 -p 1883 -m "Launch" -t Mood\Transfer\State
goto :Done.Main

:Done.Main
set NodeRed.Request=False
Echo Type End/OFF to End the mood
set /P Sym.Done=%Done.Question%?[Yes/No/Exit/End(Mood)]
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
if /I "%Sym.Done%" EQU "End" goto :End
if /I "%Sym.Done%" EQU "End Mood" goto :End
if /I "%Sym.Done%" EQU "OFF Mood" goto :End
if /I "%Sym.Done%" EQU "OFF" goto :End

cls
goto :Done

:End
set NodeRed.Request=True
set Mood=End Mood
REM call keanu.Moods.End.Bat
REM Echo SET NodeRedRequest=%NodeRed.Request%>K:\Keanu.Transfer\Transfer.bat
REM Echo SET TEXT=%MOOD%>>K:\Keanu.Transfer\Transfer.bat
REM taskkill /F /IM "vlc.exe">K:\Keanu.Transfer\Transfer2.bat
REM Echo call K:\Keanu.Transfer\Delete.Transfer.bat>>K:\Keanu.Transfer\Transfer2.bat

mosquitto_pub -h 192.168.1.170 -p 1883 -m "End" -t Mood\Transfer\State
mosquitto_pub -h 192.168.1.100 -p 1883 -u mqtt -P mqtt -m "End" -t Mood\End

REM Echo Call KEANU.BYPASS>>K:\Keanu.Transfer\Transfer.bat
REM Echo Call Keanu.Moods.Check.bat>>K:\Keanu.Transfer\Transfer.bat
REM mosquitto_pub -h 192.168.1.170 -p 1883 -m "ON" -t Mood\Transfer\State
goto :EOF

:Question.Yes
Echo No Entry(if Updated is Comment This Out)
pause
goto :FileON
Echo Failed
Keanu.logic.Main.bat

:Question.No
Keanu.logic.Main.bat


:Logic
set NodeRed.Request=False
Echo KEANU_LOGIC ONing
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
keanu.logic.bat 2>>%access.logs%

:LogicMain
set NodeRed.Request=False
Echo KEANU_LOGIC_MAin ONing
echo %keanu.date.time% calling [keanu.logic.Main.bat] >>%access.logs%
keanu.logic.Main.bat 2>>%access.logs%



:loading
call Keanu.loading.bat
Echo KEANU_LOGIC ONing
call keanu.logic.bat 2>>%access.logs%


:Exit
set NodeRed.Request=False
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
copy %Errorlog% %Errorlog.Prev%>nul
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



:EOF
exit