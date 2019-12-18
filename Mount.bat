@echo off
set Caller=%Process.Name%
set Process.Name=Keanu.Mount_Essesntials
set Mount_Used=Yes

:Launcher_check
echo %Launcher?%|findstr /i "Yes"
if %errorlevel% equ 0 (
goto :Mount_Essesntials
)
Echo Launcher not Used
Set Error_list=R06
Error_list.bat
goto :Mount_error


:Mount_Essesntials
Echo Mounting Mount_Essesntials
call Keanu.config.bat
call keanu.Request.Admin.bat
call keanu.data.time.bat

:Mount_Varaibles
set Access.logs= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"
set Access.log= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.logs= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.log= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.logs= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.log= "H:\Keanu.Access.Logs\%Keanu.date.time%.txt"

set Access.Error= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Errors= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acess.Errors= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:\Keanu.Acces.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:\Keanu.Acess.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:\Keanu.Aces.Logs\%Keanu.date.time%Fatal.txt"

:Mount_Locations
Echo Checking if in home Network
Echo Checking if in home Network >>%access.logs%

Netsh WLAN show interfaces >Temp.Ip.txt
>nul type Temp.ip.txt|findstr /i "%Home_SSID%"
if %errorlevel% equ 0 (
goto :Mount_Network_Main_New
del /F /Q Temp.ip.txt >nul 2>nul
)
if %errorlevel% equ 1 (
goto :Mount_Local_Dir
del /F /Q Temp.ip.txt >nul 2>nul
)
del /F /Q Temp.ip.txt >nul 2>nul
goto :Mount_error


:Mount_Network_Main_new
:unMount
@echo on
cls
Echo Unmounting Process continue?
cd /D %Local_dir%
pause
REM goto :Mount_Essesntials
subst K: /D >nul 2>nul
subst H: /D >nul 2>nul
subst J: /D >nul 2>nul
echo Unmount done
pause
cls
@echo off

Set Mount_Type=Network_new
subst K: \\%Main_Server_IP%\Keanu
subst H: \\%Main_Server_IP%\keanu.Heavy
subst J: \\%Main_Server_IP%\Projects\Django.Dev

cd /d K:\

:Mount_Network_Main_old
Set Mount_Type=Network_Old
net use K: \\%Main_Server_IP%\Keanu
net use H: \\%Main_Server_IP%\keanu.Heavy
net use J: \\%Main_Server_IP%\Projects\Django.Dev
goto :Mounted

:Mount_Local_Dir
echo Local
pause
:unMount

@echo on
cls
Echo Unmounting Process continue?
REM cd /D %Local_dir%
cd /d C:\
pause
REM goto :Mount_Essesntials



echo Unmount done
pause
cls
@echo off
Set Mount_Type=Local
Echo you are Currently not in your Home Network
timeout /t 4
Set reply=Launching Local Keanu
REM call reply.bat

subst K: %Local_PC_Dir%
if %errorlevel% equ 1 (
subst K: /d >nul 2>nul
)
subst H: %Local_PC_Heavy%
if %errorlevel% equ 1 (
subst H: /d >nul 2>nul
)
subst J: %Local_PC_Projects%
if %errorlevel% equ 1(
subst J: /d >nul 2>nul
)
goto :Mounted


:Mount_error
Set Error=R04
Error_list.bat
exit
goto :eof

:Mount_old
net share 
net use K: \\127.0.0.1\keanu >nul 2>nul
net share
net use H: \\127.0.0.1\keanu.Heavy >nul 2>nul
net share
net use J: \\127.0.0.1\keanu\Projects\Django.Dev >nul 2>nul

:Mounted
REM net share Keanu=%Local_Dir% /GRANT:Everyone,FULL
K:
cd /d K:\

:Mount_Logs
echo ############################### >>%access.logs%
echo ############################### >>%access.logs%
echo %keanu_name% Version %Version% >>%access.logs%
echo %keanu_name% Session Started >>%access.logs%
echo %keanu_name% Started Date %keanu.date% >>%access.logs%
echo %keanu_name% Started Time %keanu.time% >>%access.logs%
echo ############################### >>%access.logs%
echo ############################### >>%access.logs%

Echo ==============================MOUNT.LOG.START============================= >>%access.logs%
Echo %keanu.date.time% Mount Was Started and Essesntial Processes Completed >>%access.logs%
Echo %keanu.date.time% Caller     = %Caller% >>%access.logs%
Echo %keanu.date.time% Launcher   = %Launcher% >>%access.logs%
Echo %keanu.date.time% Debug      = %Debug% >>%access.logs%
Echo %keanu.date.time% Keanu_name = %keanu_name% >>%access.logs%
Echo %keanu.date.time%                           >>%access.logs%
Echo %keanu.date.time% User:Keanu.Mount Support_Process [Keanu.Request.Admin] Was Called by [%Caller%] >>%access.logs%
Echo %keanu.date.time% User:Keanu.Mount Support_Process [Keanu.Date.Time] Was Called by [%caller%]>>%access.logs%
Echo ==============================MOUNT.LOG.END ============================= >>%access.logs%
Echo ==============================KEANU.CONFIG.START========================== >>%access.logs%
type Keanu.Config.bat >>%access.logs%
Echo ===============================KEANU.CONFIG.END========================== >>%access.logs%


:FullScreen
echo %FullScreen%|findstr /i "Yes"
if %errorlevel% equ 0 (
cls
echo %keanu.date.time% Adjusting View To Full Screen >>%access.logs%
CLS
REM mode con lines=32766
Echo %keanu.date.time% User:%user% Support_Process [Keanu.FullScreen] Was Called by [Keanu.Main]>>%access.logs%
call FULLSCREEN.BAT
REM mode con:cols=80 lines=100
)




:Last
K:
cd K:\


Set Mount_Finished=Yes
:EOF
