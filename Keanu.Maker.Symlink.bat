@echo %Debug%
Set Process.Name=keanu.Maker.Symlink
call keanu.location.bat
echo %keanu.date.time% User:%user% Keanu.Maker.Symlink started >>%access.logs%

set Process.Name=Keanu.Maker.Symlink
set Errorlog=keanu.Maker.symlink.Errors.txt
set Errorlog.Prev=keanu.Maker.symlink.Errors.Prev.txt

Echo Keanu Sym Link Maker
Echo Keanu: Create Sym Link?
pause
goto :sym001


:sym001
cls
set /p file.or.folder=Sym link For File or Folder?
echo %keanu.date.time% User:%user% Sym link For File or Folder? = %file.folder% >>%access.logs% 2>1&
if /I "%file.or.folder%" EQU "File" goto :File
if /I "%file.or.folder%" EQU "Folder" goto :Folder
if /I "%file.or.folder%" EQU "Exit" goto :Exit
if /I "%file.or.folder%" EQU "E" goto :Exit
if /I "%file.or.folder%" EQU "Keanu" goto :Keanu
if /I "%file.or.folder%" EQU "K" goto :Keanu

cls
goto :sym001



:File
Echo Verifying Location
Echo Make Sure You Do note Use K:\ as source drive
Echo symlink Requires Local drive
Echo Make sure You include extension of File
set /P CheckK.File=is the file in the Keanu Files?[Yes/No]
if /I "%CheckK.File%" EQU "Yes" goto :CheckK.File.Yes
if /I "%CheckK.File%" EQU "Y" goto :CheckK.File.Yes
if /I "%CheckK.File%" EQU "No" :CheckK.File.No
if /I "%CheckK.File%" EQU "N" :CheckK.File.No
if /I "%CheckK.File%" EQU "Exit" goto :Exit
if /I "%CheckK.File%" EQU "E" goto :Exit
if /I "%CheckK.File%" EQU "Keanu" goto :Keanu
if /I "%CheckK.File%" EQU "K" goto :Keanu
goto :File

:CheckK.File.Yes
Echo Make sure You include extension of File
set /p Sym.File.Original=Original File as it is in Keanu (Name only not Directory)?
echo %keanu.date.time% User:%user% Original File as it is in Keanu (Name only not Directory)? = %Sym.File.Original% >>%access.logs% 2>1&
set Sym.File.Original.old=%Sym.File.Original%
set Sym.File.Original=C:\Keanu\%Sym.File.Original.old%
goto :File.New

:CheckK.File.No
Echo Make sure You include extension of File
set /p Sym.File.Original=Full location of Original File?
echo %keanu.date.time% User:%user% Full location of Original File? = %Sym.File.Original% >>%access.logs% 2>1&
goto :File.New

:File.New
set /p Sym.File.New=Sym File link in Keanu?
echo %keanu.date.time% User:%user% Sym File link in Keanu? = %Sym.File.New% >>%access.logs% 2>1&
goto File.Verify

:File.Verify
cls
Echo Verify if SymLink info is correct?
Echo Original File   =%sym.File.Original%
Echo New Symlink File (in Keanu)=%sym.File.New% 
set /P Sym.File.Verify=Is the info Correct?[Yes/No/Exit]
echo %keanu.date.time% User:%user% Is the info Correct?[Yes/No/Exit] = %Sym.File.Verify% >>%access.logs% 2>1&

if /I "%sym.File.Verify%" EQU "Yes" goto :File.Make
if /I "%sym.File.Verify%" EQU "Y" goto :File.Make
if /I "%sym.File.Verify%" EQU "No" goto :File
if /I "%sym.File.Verify%" EQU "N" goto :File.Make
if /I "%sym.File.Verify%" EQU "Exit" goto :Exit
if /I "%sym.File.Verify%" EQU "E" goto :Exit
if /I "%sym.File.Verify%" EQU "Keanu" goto :Keanu
if /I "%sym.File.Verify%" EQU "K" goto :Keanu

goto :File.Verify


:File.Make
echo %keanu.date.time% User:%user% stating sym.File.Maker Process >>%access.logs% 2>1&
echo %keanu.date.time% User:%user% stating Writting K:\%Sym.File.New% >>%access.logs% 2>1&
Echo %botname% symlink Maker Process Starting
Timeout /t 01
set
call Keanu.location.bat
REM Use /H when you want to create a hard link pointing to a file:
mklink /H "C:\Keanu\%Sym.File.New%" "%Sym.File.Original%" 2>%Errorlog%
Echo adding Command log
Echo K:\%Sym.File.New% adding Process %Sym.File.New% to Command list >>%access.logs% 2>1&
Echo %Sym.File.New%{call %Sym.File.New%>>Keanu.LogicData.Commands.txt
Echo Process done
Echo K:\%Sym.File.New% Has Been Made sym Link To %Sym.File.Original% >>%access.logs% 2>1&
goto :SuccessCheck
pause

cls
goto :Done





:Folder
Echo Verifying Location
Echo Make Sure You Do note Use K:\ as source drive
Echo symlink Requires Local drive
Echo Make sure You include extension of Folder
set /P CheckK.Folder=is the Folder in the Keanu Folders?[Yes/No]
if /I "%CheckK.Folder%" EQU "Yes" goto :CheckK.Folder.Yes
if /I "%CheckK.Folder%" EQU "Y" goto :CheckK.Folder.Yes
if /I "%CheckK.Folder%" EQU "No" :CheckK.Folder.No
if /I "%CheckK.Folder%" EQU "N" :CheckK.Folder.No
if /I "%CheckK.Folder%" EQU "Exit" goto :Exit
if /I "%CheckK.Folder%" EQU "E" goto :Exit
if /I "%CheckK.Folder%" EQU "Keanu" goto :Keanu
if /I "%CheckK.Folder%" EQU "K" goto :Keanu
goto :Folder

:CheckK.Folder.Yes
set /p Sym.Folder.Original=Original Folder as it is in Keanu (Name only not Directory)?
echo %keanu.date.time% User:%user% Original Folder as it is in Keanu (Name only not Directory)? = %Sym.Folder.Original% >>%access.logs% 2>1&
set Sym.Folder.Original.old=%Sym.Folder.Original%
set Sym.Folder.Original=C:\Keanu\%Sym.Folder.Original.old%
goto :Folder.New

:CheckK.Folder.No
Echo Make sure You include extension of Folder
set /p Sym.Folder.Original=Full location of Original Folder?
echo %keanu.date.time% User:%user% Full location of Original Folder? = %Sym.Folder.Original% >>%access.logs% 2>1&
goto :Folder.New

:Folder.New
set /p Sym.Folder.New=Sym Folder link in Keanu?
echo %keanu.date.time% User:%user% Sym Folder link in Keanu? = %Sym.Folder.New% >>%access.logs% 2>1&
goto Folder.Verify

:Folder.Verify
Echo Verify if symLink info is correct?
Echo Original Folder   =%sym.Folder.Original%
Echo New symlink Folder=C:\Keanu\%sym.Folder.New% 
set /P Sym.Folder.Verify=Is the info Correct?[Yes/No/Exit]
echo %keanu.date.time% User:%user% Is the info Correct?[Yes/No/Exit] = %Sym.Folder.Verify% >>%access.logs% 2>1&

if /I "%sym.folder.Verify%" EQU "Yes" goto :Folder.Make
if /I "%sym.folder.Verify%" EQU "Y" goto :Folder.Make
if /I "%sym.folder.Verify%" EQU "No" goto :Folder
if /I "%sym.folder.Verify%" EQU "N" goto :Folder.Make
if /I "%sym.folder.Verify%" EQU "Exit" goto :Exit
if /I "%sym.folder.Verify%" EQU "E" goto :Exit
if /I "%sym.folder.Verify%" EQU "Keanu" goto :Keanu
if /I "%sym.folder.Verify%" EQU "K" goto :Keanu

cls
goto :Folder.Verify


:Folder.Make
echo %keanu.date.time% User:%user% stating sym.Folder.Maker Process >>%access.logs% 2>1&
echo %keanu.date.time% User:%user% stating Writting K:\%Sym.Folder.New% >>%access.logs% 2>1&
Echo %botname% symlink Maker Process Starting
Timeout /t 01
set
call Keanu.location.bat
REM mklink "/J" Use /J to create a hard link pointing to a directory, also known as a directory junction:
mklink /J "C:\Keanu\%Sym.Folder.New%" "%Sym.Folder.Original%" 2>%Errorlog%
Echo Process done
Echo C:\Keanu\%Sym.Folder.New% Has Been Made sym Link To %Sym.Folder.Original% 2>1&
goto :SuccessCheck
pause

cls
goto :Done



:Done
set /P Sym.Done=sym.Link Making Done?[Yes/No/Exit]
echo %keanu.date.time% User:%user% sym.Link Making Done?[Yes/No/Exit] = %Sym.Done% >>%access.logs% 2>1&

if /I "%Sym.Done%" EQU "Yes" goto :Keanu
if /I "%Sym.Done%" EQU "Y" goto :Keanu
if /I "%Sym.Done%" EQU "Keanu" goto :Keanu
if /I "%Sym.Done%" EQU "K" goto :Keanu
if /I "%Sym.Done%" EQU "No" goto :sym001
if /I "%Sym.Done%" EQU "N" goto :sym001
if /I "%Sym.Done%" EQU "E" goto :Exit
if /I "%Sym.Done%" EQU "Exit" goto :Exit

cls
goto :Done




:Exit
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo Exiting
echo %keanu.date.time% User:%user% calling Exit.Keanu.bat >>%access.logs% 2>1&
Timeout /t 1
cls
keanu.Exit.bat

:SuccessCheck
if %errorlevel% EQU "0" (
Echo Process [%Process.Name] successful
)
if %errorlevel% EQU "1" (
goto :ErrorLog
)
goto :Done


:Keanu
Echo Error Log being Archived by User:%user% Time:%keanu.date.time% >>%Errorlog%
copy %Errorlog% %Errorlog.Prev%
Echo Cleared on User:%user% Time:%keanu.date.time% >%Errorlog%
echo going back to keanu
Timeout /t 1
echo %keanu.date.time% User:%user% calling Keanu.bat >>%access.logs% 2>1&
cls
Keanu.logic.Main.bat

:ErrorLog
Echo Above is the Error Log for [Keanu..Maker.symlink] Process >>%Errorlog%
Echo Error Source  [Keanu..Maker.symlink] >>%Errorlog%
Echo Error Time %keanu.date.time% >>%Errorlog%
type %Errorlog% >>%acesslogs%ErrorName%
Set ErrorName=%Keanu.date.time%ErrorFor%Process.Name%
Set ErrorFile=K:\keanu.Access.Errors\%ErrorName%
type %Errorlog% >%ErrorFile%
Echo Process [Keanu.Maker.Symlink] Was NOT successful
type %Errorlog%
pause
goto :Done


:EOF