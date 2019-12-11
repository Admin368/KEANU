@echo off
set Process.Name=Keanu.Maker.File

call keanu.locations.bat
echo %keanu.date.time% User:%user% Fired Process [Keanu.Maker.File] >>%access.logs% 2>&1


net use K: \\192.168.1.168\keanu >nul 2>nul
K: >nul

type keanu.logo.data.txt
Echo Keanu Keanu File Maker
Echo Keanu: Create File?
pause
goto :sys00MK1

:sys00MK1
set /P MK.Proceed=Would You Like To Make File?[Yes/No]
REM echo %keanu.date.time% User:%user% Sym link For File or Folder? = %MK.Proceed% >>%access.logs% 2>1&
if /I "%MK.Proceed%" EQU "Yes" goto :Mk.Yes
if /I "%MK.Proceed%" EQU "Y" goto :Mk.Yes
if /I "%MK.Proceed%" EQU "No" goto :Mk.No
if /I "%MK.Proceed%" EQU "N" goto :Mk.No
if /I "%MK.Proceed%" EQU "Exit" goto :Exit
if /I "%MK.Proceed%" EQU "E" goto :Exit
if /I "%MK.Proceed%" EQU "Keanu" goto :Keanu
if /I "%MK.Proceed%" EQU "K" goto :Keanu
cls
goto :sys00MK1


:Mk.Yes
goto Mk.file




:MK.No
goto :Keanu




:Mk.File
set /P MK.File.Name=Name Of File?
echo %keanu.date.time% User:%user% Full location of Original File? = %MK.File.Name% >>%access.logs% 2>1&
goto :MK.Verify


:MK.Verify
Echo Verifying Extension
echo %MK.File.Name%|findstr /i "[^\.]*bat" >nul
if %errorlevel% equ 1 (
set Mk.File.Name.old=%MK.File.Name%
set Mk.File.Name=%Mk.File.Name.old%.bat
)
set set Mk.File.Name.old=%MK.File.Name%
Echo Verify if Name info is correct?
Echo File Name   =%MK.File.Name%
set /P MK.File.Verify=Is the info Correct?[Yes/No/Exit]
echo %keanu.date.time% User:%user% Is the info Correct?[Yes/No/Exit] = %MK.File.Verify% >>%access.logs% 2>1&

if /I "%MK.File.Verify%" EQU "Yes" goto :MK.File.Make
if /I "%MK.File.Verify%" EQU "Y" goto :MK.File.Make
if /I "%MK.File.Verify%" EQU "No" cls && goto :sys00MK1
if /I "%MK.File.Verify%" EQU "N" cls && goto :sys00MK1
if /I "%MK.File.Verify%" EQU "Exit" goto :Exit
if /I "%MK.File.Verify%" EQU "E" goto :Exit
if /I "%MK.File.Verify%" EQU "Keanu" goto :Keanu
if /I "%MK.File.Verify%" EQU "K" goto :Keanu
cls
goto :MK.Verify


:MK.File.Make
cls
Echo Process [make.file] Started
K: >nul
type "%MK.File.Name%" >nul 2>nul
if %errorlevel% EQU "0" (
Echo File Already Exists And Saved As SAVED.%MK.File.Name%
goto :Done
)
if %errorlevel% EQU "1" (
Echo No Similar File found
Echo now Creating
)
Echo REM 107.Studios .File Created by "%user%" on "%keanu.date.time%" >%MK.File.Name%
Echo @echo off >>%MK.File.Name%
Echo Set Process.Name.Default=%MK.File.Name% >>%MK.File.Name%
echo %keanu.date.time% User:%user% Process [Keanu.Maker.File] Creating signature >>%access.logs%
Echo Creating signature
Echo Rem Error Margin >>%MK.File.Name%
Echo Echo [%MK.File.Name%] starting here >>%MK.File.Name%

echo %keanu.date.time% User:%user% Process [Keanu.Maker.File] Creating File dependencies >>%access.logs%
Echo Creating File dependencies
Type Keanu.Maker.File.Format.txt >>%MK.File.Name%

echo %keanu.date.time% User:%user% Process [Keanu.Maker.File] Updating Version Log >>%access.logs%
Echo Updating Version Log
Echo -Adding of [%MK.File.Name%] [%keanu.date.time%] >>keanu.Version.Log.txt

echo %keanu.date.time% User:%user% Process [Keanu.Maker.File] Adding to Command Log >>%access.logs%
Echo Adding to Command Log
Echo %MK.File.Name%{call %MK.File.Name% >>Keanu.LogicData.Commands.txt
Echo Checking if Process Done
type "%MK.File.Name%" >nul
if %errorlevel% EQU "1" (
Echo Process Failed!
Echo try Again
)
if %errorlevel% EQU "0" (
Echo Process [make.file] Done
)
pause
goto :Q.Var



:Q.Var
Set /p Q.Var=Wuld You like to make Command Variations?[Yes/No]
Echo %keanu.date.time% User:%user% Wuld You like to make Command Variations?[Yes/No] = %Q.Var% >>%access.logs% 2>1&
if /I "%Q.var%" EQU "Yes" goto :Add.Var
if /I "%Q.var%" EQU "Y" goto :Add.Var
if /I "%Q.var%" EQU "No" goto :MK.Another
if /I "%Q.var%" EQU "N" goto :MK.Another
if /I "%Q.var%" EQU "Exit" goto :Exit
if /I "%Q.var%" EQU "E" goto :Exit
if /I "%Q.var%" EQU "Keanu" goto :Keanu
if /I "%Q.var%" EQU "K" goto :Keanu
cls
goto :Q.Var


:MK.Another
set /p MK.Another=Would You Like To Make Another File?[Yes/No]
echo %keanu.date.time% User:%user%Would You Like To Make Another File?[Yes/No] = %MK.Another% >>%access.logs% 2>1&
if /I "%MK.Another%" EQU "Yes" goto :Mk.Yes
if /I "%MK.Another%" EQU "Y" goto :Mk.Yes
if /I "%MK.Another%" EQU "No" cls && goto :sys00MK1
if /I "%MK.Another%" EQU "N" cls && goto :sys00MK1
if /I "%MK.Another%" EQU "Exit" goto :Exit
if /I "%MK.Another%" EQU "E" goto :Exit
if /I "%MK.Another%" EQU "Keanu" goto :Keanu
if /I "%MK.Another%" EQU "K" goto :Keanu
cls
goto :MK.Another

:Add.Var
Echo if it will be a Sym write full file name (including.bat)
Set /p Add.Var=Add Command to link to "%MK.File.Name%"?
echo %keanu.date.time% User:%user% Addding command %Add.Var% for Command %MK.File.Name% >>%access.logs% 2>1&
Echo Adding to Command Log
Echo %Add.Var%{call %MK.File.Name% >>Keanu.LogicData.Commands.txt
Echo making Automatic Symlink
Echo Process [make.file] Done
goto :makeSym

:makeSym
set /p makeSym=Would You To Add Make Auto SymLink[Yes/No]
echo %keanu.date.time% User:%user%Would You To Add Make Auto SymLink[Yes/No] = %makeSym% >>%access.logs% 2>1&
if /I "%makeSym%" EQU "Yes" goto :AutoSym
if /I "%makeSym%" EQU "Y" goto :AutoSym
if /I "%makeSym%" EQU "No" goto :Add.Var.Another
if /I "%makeSym%" EQU "N" goto :Add.Var.Another
if /I "%makeSym%" EQU "Exit" goto :Exit
if /I "%makeSym%" EQU "E" goto :Exit
if /I "%makeSym%" EQU "Keanu" goto :Keanu
if /I "%makeSym%" EQU "K" goto :Keanu
cls
goto :makeSym

:AutoSym
Echo Making auto Symlink
Echo %Add.Var%|findstr /i "[^\.]*bat"
if %errorlevel% EQU "1" (
echo You forgot .bat
pause
echo adding BAT Extension
set FormerSym=%Add.Var%
set Add.Var=%FormerSym%.bat
goto :AutoSym.Make
)
if %errorlevel% EQU "0" (
goto :AutoSym.Make
)
goto :AutoSym.Make

:AutoSym.Make
Echo Starting AutoSym.Make
set A.Sym.Original=C:\keanu\%MK.File.Name%
set A.Sym.New=C:\keanu\%Add.Var%
mklink /H "%A.Sym.New%" "%A.Sym.Original%"
goto :Add.Var.Another 

:Add.Var.Another
set /p Add.Var.Another=Would You Like To Associate Another command?[Yes/No]
echo %keanu.date.time% User:%user%Would You Like To Associate Another command?[Yes/No] = %Add.Var.Another% >>%access.logs% 2>1&
if /I "%Add.Var.Another%" EQU "Yes" goto :Add.Var
if /I "%Add.Var.Another%" EQU "Y" goto :Add.Var
if /I "%Add.Var.Another%" EQU "No" cls && goto :sys00MK1
if /I "%Add.Var.Another%" EQU "N" cls && goto :sys00MK1
if /I "%Add.Var.Another%" EQU "Exit" goto :Exit
if /I "%Add.Var.Another%" EQU "E" goto :Exit
if /I "%Add.Var.Another%" EQU "Keanu" goto :Keanu
if /I "%Add.Var.Another%" EQU "K" goto :Keanu
cls
goto :Add.Var.Another


:Updater

:Exit
echo Exiting
echo %keanu.date.time% User:%user% calling Exit.Keanu.bat >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat


:Keanu
echo going back to keanu
Timeout /t 1
echo %keanu.date.time% User:%user% calling Keanu.bat >>%access.logs% 2>1&
cls
Keanu.logic.Main.bat