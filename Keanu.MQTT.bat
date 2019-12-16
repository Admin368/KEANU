REM 107.Studios .File Created by "CreatorMode" on "2019_10_17-11;28_39" 
@echo %Debug% 
Set Process.Name.Default=Keanu.MQTT.bat 
Rem Error Margin 
Echo [Keanu.MQTT.bat] starting here 
@echo %Debug%

set Process.Name=%Process.Name.Default%
set Proces.Name=%Process.Name%
set Question.Asked=Send General MQTT Message?[Yes/No]
Set Done.Question=Are You Done?[Yes/No]
set Errorlog=Keanu.Error.Log.txt
set Errorlog.Prev=Keanu.Error.Log.Prev.txt
call keanu.location.bat

goto :check.MQTT.Request

:check.MQTT.Request 
Echo Checking MQTT.Request Status
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status >>%access.logs%

Echo %MQTT.Request%|findstr /i "Yes True"
if %errorlevel% equ 0 (
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status [%errorlevel%] [%MQTT.Request%]>>%access.logs%
set MQTT.Target=192.168.1.168
set MQTT.Topic=MqttRequest
goto :MQTT.Engine
)
if %errorlevel% equ 1 (
Echo %keanu.date.time% User:%user% [%Process.name%] Checking MQTT.Request Status [%errorlevel%] [%MQTT.Request%]>>%access.logs%
goto :Question
)

goto :Question
:FileStart




REM ################################################################################
REM Main File starts From HERE
:MainFuction
set /p MQTT.Target=%user%:Please Enter MQQt Server(Target)
echo %keanu.date.time% User:%user% Please Enter MQQt Server(Target) = %MQTT.Target% >>%access.logs%

set /p MQTT.Topic=%user%:Please Enter MQQt Server(Target)
echo %keanu.date.time% User:%user% Please Enter MQQt Server(Target) = %MQTT.Topic% >>%access.logs%

set /p MQTT.Message=%user%:Please Enter MQQt Server(Target)
echo %keanu.date.time% User:%user% Please Enter MQQt Server(Target) = %MQTT.Message% >>%access.logs%
goto :MQTT.Engine

:MQTT.Engine
mosquitto_pub -h %MQTT.Target% -p 1883 -m "%MQTT.Message%" -t %MQTT.Topic%
set MQTT.Request=False

goto :successCheck
goto :Done
goto :Keanu
REM Main File Ends HERE
REM ################################################################################


:Question
Echo The Following are The other Available Targets
Echo ########[1] Server68
Echo ########[2] Legend-T3
Echo ########[3] Jey-Pc
Echo ########[4] Xpi
Echo ########[5]
Echo ########[6]
set /p Question.Answer=%user%:%Question.Asked%
echo %keanu.date.time% User:%user% %Question.Asked% = %Question.Answer% >>%access.logs%
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
if /I "%Question.Answer%" EQU "1" goto :Server68
if /I "%Question.Answer%" EQU "Legend-T3" goto :Legend-T3
if /I "%Question.Answer%" EQU "2" goto :Legend-T3
if /I "%Question.Answer%" EQU "Jey-Pc" goto :Jey-Pc
if /I "%Question.Answer%" EQU "3" goto :Jey-Pc
if /I "%Question.Answer%" EQU "Xpi" goto :Xpi
if /I "%Question.Answer%" EQU "4" goto :Xpi
cls
goto :Question

:Server68
Echo Starting Server68 MQTT
Echo %keanu.date.time% User:%User% Process [Keanu.MQTT.Server68] was called by [Keanu.MQTT.bat] >>%access.logs%
call Keanu.MQTT.Server68.bat


:Legend-T3
Echo Starting Legend-T3
Echo %keanu.date.time% User:%user% Process [Keanu.MQTT.Legend-t3] was called by [Keanu.MQTT.bat] >>%access.logs%
call Keanu.MQTT.Legend-t3.bat

:Jey-Pc
Echo Starting Jey-Pc
Echo %keanu.data.time% User:%user% Process [Keanu.MQTT.Jey-Pc] was called by [Keanu.Jey-Pc] >>%access.logs%
call Keanu.MQTT.Jey-PC.bat

:Xpi
Echo Starting Xpi
Echo %keanu.data.time% User:%user% Process [Keanu.MQTT.Jey-Pc] was called by [Xpi] >>%access.logs%
call Keanu.MQTT.Xpi.bat



:Done
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
goto :Done



:Question.Yes
Echo No Entry(if Updated is Comment This Out)
pause
goto :FileStart
Echo Failed
Keanu.logic.Main.bat

:Question.No
Echo No Entry(if Updated is Comment This Out)
pause
goto :Done
Echo Failed
Keanu.logic.Main.bat


:Logic
Echo KEANU_LOGIC starting
echo %keanu.date.time% calling [keanu.logic.bat] >>%access.logs%
keanu.logic.bat
:LogicMain
Echo KEANU_LOGIC_MAin starting
echo %keanu.date.time% calling [keanu.logic.Main.bat] >>%access.logs%
keanu.logic.Main.bat


:loading
call Keanu.loading.bat
Echo KEANU_LOGIC starting
call keanu.logic.bat


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
Echo Process [%Process.Name%] Main Function Was NOT Successful
type %Errorlog%
pause
goto :Done



:EOF