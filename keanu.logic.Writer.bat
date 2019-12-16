Echo [Keanu.Logic.Writter] starting here 
@echo %Debug%
Set Process.Name=keanu.logic.Writer
call keanu.location.bat
REM Echo No Code Yet (if Updated is Comment This Out)
REM pause
REM Keanu.logic.Main.bat

set SpeechWord01=Say
set SpeechWord02=Respond
set CommandWord01=Run
set CommandWord02=call
set Question.Asked=Advanced Logic Writting?[Yes/No]

set /p Admin=<keanu.Adm.txt
if /I "%Admin%" EQU "%user%" goto :Question
goto :SpeechWriteBasic
REM ################################################################################
REM Main File starts From HERE

:FileStart
goto :Logic.Speech

:Logic.Speech
color 4a
call keanu.logo.bat
Echo Logic Check
cls
Echo [Logic.Speech] Path
:L.S
echo %BotName%: Define The entry
set /p L.S=%BotName%:Logic/Speech/Variable[L/S/V]?
if /I "%L.S%" EQU "L" goto :L
if /I "%L.S%" EQU "Logic" goto :L
if /I "%L.S%" EQU "S" goto :S
if /I "%L.S%" EQU "Variable" goto :V
if /I "%L.S%" EQU "V" goto :V
if /I "%L.S%" EQU "Speech" goto :S
if /I "%L.S%" EQU "Exit" goto :Exit
if /I "%L.S%" EQU "E" goto :Exit
if /I "%L.S%" EQU "Keanu" goto :Keanu
if /I "%L.S%" EQU "K" goto :Keanu
if /I "%L.S%" EQU "Logic" goto :Keanu
if /I "%L.S%" EQU "L" goto :Keanu
goto :L.S

:L
echo %BotName%: What Command shuld i Run
set /p answer=%BotName%: What should be executed for input: '%text%'?
echo %answer%>Keanu.Logic.Writter.Temp.txt
goto :LogicWrite


:S
echo %BotName%: What shuld i Say?
set /p answer=%BotName%: How should this be answered for input '%text%'?
REM echo %answer%>Keanu.Logic.Writter.Temp.txt
%answer%>Keanu.Logic.Writter.Temp.txt
goto :SpeechWrite

:V
call Keanu.LogicData.Variable.Create.bat
goto :EOF




:LogicCheck
color 4a
call keanu.logo.bat
Echo Logic Check
cls
echo %BotName%: What Command shuld i Run Or Say.
set /p answer=%BotName%: How should this be answered '%text%'?
if /I "%answer%" EQU "h" goto :EnterAnswer
if /I "%answer%" EQU "Exit" goto :Exit
if /I "%answer%" EQU "E" goto :Exit
if /I "%answer%" EQU "Keanu" goto :Keanu
if /I "%answer%" EQU "K" goto :Keanu
if /I "%answer%" EQU "Logic" goto :Keanu
if /I "%answer%" EQU "L" goto :Keanu
echo %answer% >Keanu.Logic.Writter.Temp.txt
goto :SpeechCheck1

:enterAnswer
Echo Please Enter An answer
goto :LogicCheck

:SpeechCheck1
echo %answer%|findstr /i "%SpeechWord01%" >nul
if %errorlevel% equ 0 (
goto :Speech.Word.Remove
)
echo %answer%|findstr /i "%SpeechWord02%" >nul
if %errorlevel% equ 0 (
if exist (
goto :Speech.Word.Remove
)
echo %answer%|findstr /i "%CommandWord01%" >nul
if %errorlevel% equ 0 (
goto :Command.Word.Remove
)
echo %answer%|findstr /i "%CommandWord02%" >nul
if %errorlevel% equ 0 (
goto :Command.Word.Remove
)
goto :SpeechWriteBasic

:Command.Word.Remove
REM setlocal enableextensions disabledelayedexpansion
set search=%CommandWord01% 
set replace=
set textFile=Keanu.Logic.Writter.Temp.txt

for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
set "line=%%i"
REM setlocal enabledelayedexpansion
>>"%textFile%" echo(!line:%search%=%replace%!
)
REM endlocal
goto :LogicWrite

:Speech.Word.Remove
REM setlocal enableextensions disabledelayedexpansion
set search=%SpeechWord01% 
set replace=
set textFile=Keanu.Logic.Writter.Temp.txt
for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
set "line=%%i"
REM setlocal enabledelayedexpansion
>>"%textFile%" echo(!line:%search%=%replace%!
REM endlocal
)
REM setlocal enableextensions disabledelayedexpansion

set search=%SpeechWord02% 
set replace=
set textFile=Keanu.Logic.Writter.Temp.txt
for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
set "line=%%i"
REM setlocal enabledelayedexpansion
>>"%textFile%" echo(!line:%search%=%replace%!
REM endlocal
)
goto :SpeechWrite






:LogicWrite
set /p %answer%=<Keanu.Logic.Writter.Temp.txt
echo %text%{%answer%>>Keanu.LogicData.Commands.txt
echo %BotName%: Thanks!
call keanu.pause
cls
goto :EOF


:SpeechWrite
set /p %answer%=<Keanu.Logic.Writter.Temp.txt
echo %text%{echo %answer%>>Keanu.LogicData.Speech.txt
echo %BotName%: Thanks!
Echo Signature : %user%
call keanu.pause
cls
goto :EOF


:SpeechWriteBasic
echo %text%{echo %user% says %answer%>>Keanu.LogicData.speech.txt
echo %BotName%: Thanks!
Echo Signature : %user%
call keanu.pause
cls
goto :EOF
REM ################################################################################






:Question
color 0b
set /p Question.Answer=%user%:%Question.Asked%
Rem echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs% 2>1&
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

:Question.Yes
goto :FileStart

:Question.No
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


:EOF