@echo %Debug%
Set Process.Name=keanu.Maker.File.NO.LOC
Rem call keanu.locations.bat
Rem echo %keanu.date.time% User:%user% Fired Process [Keanu.Maker.File] >>%access.logs% 2>&1

net use K: \\192.168.1.168\keanu >nul 2>nul
net use H: \\192.168.1.168\keanu.Heavy >nul 2>nul
K: >nul

type keanu.logo.data.txt
Echo Keanu Keanu File Maker
Echo Keanu: Create File?
pause

:sys00MK1
set /p MK.Proceed=Would You Like To Make File?[Yes/No]
Rem echo %keanu.date.time% User:%user% Sym link For File or Folder? = %MK.Proceed% >>%access.logs% 2>1&
if /I %MK.Proceed% EQU "Yes" goto :Mk.Yes
if /I %MK.Proceed% EQU "Y" goto :Mk.Yes
if /I %MK.Proceed% EQU "No" goto :Mk.No
if /I %MK.Proceed% EQU "N" goto :Mk.No
if /I %MK.Proceed% EQU "Exit" goto :Exit
if /I %MK.Proceed% EQU "E" goto :Exit
if /I %MK.Proceed% EQU "Keanu" goto :Keanu
if /I %MK.Proceed% EQU "K" goto :Keanu
cls
goto :sys00MK1


:Mk.Yes
goto Mk.file




:MK.No
goto :Keanu




:Mk.File
set /p MK.File.Name=Name Of File?
Rem echo %keanu.date.time% User:%user% Full location of Original File? = %MK.File.Name% >>%access.logs% 2>1&

Echo Verify if Name info is correct?
Echo Original File   =%MK.File.Name%
set /P MK.File.Verify=Is the info Correct?[Yes/No/Exit]
Rem echo %keanu.date.time% User:%user% Is the info Correct?[Yes/No/Exit] = %MK.File.Verify% >>%access.logs% 2>1&

if /I %MK.File.Verify% EQU "Yes" goto :MK.File.Make
if /I %MK.File.Verify% EQU "Y" goto :MK.File.Make
if /I %MK.File.Verify% EQU "No" goto :File
if /I %MK.File.Verify% EQU "N" goto :MK.File.Make
if /I %MK.File.Verify% EQU "Exit" goto :Exit
if /I %MK.File.Verify% EQU "E" goto :Exit
if /I %MK.File.Verifyy% EQU "Keanu" goto :Keanu
if /I %MK.File.Verify% EQU "K" goto :Keanu
cls
goto :Keanu


:MK.File.Make
Echo Process [make.file] Started
K: >nul
type Keanu.Maker.File.Format.txt >%MK.File.Name%.bat
Echo Updating Version Log
Echo -Adding of [%MK.File.Name%] >>keanu.Version.Log.txt
Echo Adding to Command Log
Echo %MK.File.Name%{%MK.File.Name% >>keanu.Version.Log.txt
Echo Process [make.file] Done
pause
goto :MK.Another

:MK.Another
set /p MK.Another=Would You Like To Make Another File?[Yes/No]
Rem echo %keanu.date.time% User:%user% Sym link For File or Folder? = %MK.Another% >>%access.logs% 2>1&
if /I %MMK.Another% EQU "Yes" goto :Mk.Yes
if /I %MK.Another% EQU "Y" goto :Mk.Yes
if /I %MK.Another% EQU "No" goto :Mk.No
if /I %MK.Another% EQU "N" goto :Mk.No
if /I %MK.Another% EQU "Exit" goto :Exit
if /I %MK.Another% EQU "E" goto :Exit
if /I %MK.Another% EQU "Keanu" goto :Keanu
if /I %MK.Another% EQU "K" goto :Keanu
cls
goto :MK.Another


:Updater

:Exit
echo Exiting
Rem echo %keanu.date.time% User:%user% calling Exit.Keanu.bat >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat


:Keanu
echo going back to keanu
Timeout /t 1
Rem echo %keanu.date.time% User:%user% calling Keanu.bat >>%access.logs% 2>1&
cls
call Keanu.logic.bat