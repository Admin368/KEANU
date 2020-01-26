@echo off
set Caller=%Process.Name%
set Process.Name=Keanu.Mount_Essesntials
set Mount_Used=Yes
::cd /d %local_Dir%

:Launcher_check
echo %Launcher?%|findstr /i "Yes"
if %errorlevel% equ 0 (
goto :Mount_Essesntials
)
:No_launcher
cls
Echo Service : Mount.bat
Set Error_list=R06
::Error_list.bat
Echo Error: %Error_list%
Echo Error: Launcher not Used
Echo Enter "E" to Exit
Echo Enter "C" to Continue
Echo Enter "L" to Use Default Launcher
set /p Action_Mount=Action to Do :
if /I "%Action_Mount%" EQU "C" goto :Mount_Essesntials
if /I "%Action_Mount%" EQU "L" keanu.bat
if /I "%Action_Mount%" EQU "E" call Keanu.exit.bat
goto :No_launcher
goto :Mount_error


:Mount_Essesntials
Echo Mounting Mount_Essesntials
call Keanu.config.bat
call keanu.Request.Admin.bat
call keanu.date.time.bat
cd /d %local_Dir%

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
set Acess.Error= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acces.Error= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acces.Errors= "H:\Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"

:Mount_Locations
Echo Checking if in home Network

Netsh WLAN show interfaces >Temp.Ip.txt
type Temp.ip.txt|findstr /i "%Home_SSID%"
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
Echo Networking Mounting
Echo Launching Network Server Keanu
timeout /1
call unmount.bat
Set Mount_Type=Network_new
cls
cd /d C:\
Set MN=0
Set reply=Launching Network Server Keanu
REM call reply.bat


::MOUNTING_K
Echo Mounting K:
CD /d C:\
subst K: \\%Main_Server_IP%\Keanu
if %errorlevel% equ 0 Echo Mounting K Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount K
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_K=yes
Set Er_K_Msg=Drive K %Main_Server_IP%\Keanu Failed to Mount
::subst K: /d >nul 2>nul
::subst K: \\%Main_Server_IP%\Keanu
timeout /t 2
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_H
Echo Mounting H:
cd /d C:\
subst H: \\%Main_Server_IP%\keanu.Heavy
if %errorlevel% equ 0 Echo Mounting H Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount H
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_H=Yes
Set Er_H_Msg=Drive H %Main_Server_IP%\keanu.Heavy Failed to Mount
::subst H: /d >nul 2>nul
::subst H: \\%Main_Server_IP%\keanu.Heavy
timeout /t 1
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_J
Echo Mounting J:
cd /d C:\
subst J: \\%Main_Server_IP%\Projects
if %errorlevel% equ 0 Echo Mounting J Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount J
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_J=Yes
Set Er_J_Msg=Drive J %Main_Server_IP%\Projects Failed to Mount
::subst J: /d >nul 2>nul
::subst J: \\%Main_Server_IP%\Projects\
timeout /t 2
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_END
Echo %Mount_Er%|findstr /i "Error"
if %errorlevel% equ 0 (
goto :Action_Mount
) >nul
goto :Mounted


:Action_Mount
cls
::Echo Some Drives failed to Mount
Echo %MN% Drived Failed to Mount
Set AMN=1
if /i "%Er_K%" equ "Yes" Set /a AMN=%AMN%+1 >nul && Echo %AMN%.%Er_K_Msg%
if /i "%Er_H%" equ "Yes" Set /a AMN=%AMN%+1 >nul && Echo %AMN%.%Er_H_Msg%
if /i "%Er_J%" equ "Yes" Set /a AMN=%AMN%+1 >nul && Echo %AMN%.%Er_J_Msg%
Echo Enter "E" to Exit
Echo Enter "C" to Continue
Echo Enter "R" to Re_unmount and Mount Again
set /p Action_Mount=Action to Do :
if /I "%Action_Mount%" EQU "C" goto :Mounted
if /I "%Action_Mount%" EQU "R" goto :ReMount
if /I "%Action_Mount%" EQU "E" call Keanu.exit.bat
Echo incorrect option Selected
cls


:ReMount
Echo Remounting
timeout /t 3
call unmount.bat
call Mount.bat
goto :Mounted


:Mount_Network_Main_old
Set Mount_Type=Network_Old
net use K: \\%Main_Server_IP%\Keanu
net use H: \\%Main_Server_IP%\keanu.Heavy
net use J: \\%Main_Server_IP%\Projects\Django.Dev
goto :Mounted

:Mount_Local_Dir
goto :Mount_Local_Dir_New

:Mount_Local_Dir_New
Echo (New Method) Local Mounting 
Echo (New Method) Launching Local Keanu 
timeout /t 1
call unmount.bat
Set Mount_Type=Local_New
cls
cd /d C:\
Set MN=0
Set reply=New Method Launching Local Keanu
REM call reply.bat

::MOUNTING_K
Echo Mounting K:
CD /d C:\
::subst K: \\%Main_Server_IP%\Keanu
subst K: %Local_PC_Dir%
if %errorlevel% equ 0 Echo Mounting K Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount K
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_K=yes
Set Er_K_Msg=Drive K %Local_PC_Dir% Failed to Mount
::subst K: /d >nul 2>nul
::subst K: \\%Main_Server_IP%\Keanu
timeout /t 2
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_H
Echo Mounting H:
cd /d C:\
::subst H: \\%Main_Server_IP%\keanu.Heavy
subst H: %Local_PC_Heavy%
if %errorlevel% equ 0 Echo Mounting H Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount H
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_H=Yes
Set Er_H_Msg=Drive H %Local_PC_Heavy% Failed to Mount
::subst H: /d >nul 2>nul
::subst H: \\%Main_Server_IP%\keanu.Heavy
timeout /t 1
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_J
Echo Mounting J:
cd /d C:\
::subst J: \\%Main_Server_IP%\Projects
subst J: %Local_PC_Projects%
if %errorlevel% equ 0 Echo Mounting J Successful&&Set cls=yes
if %errorlevel% equ 1 (
Echo Error: Failed to Mount J
set Mount_Er=Error
set /a MN=%MN%+1
Set Er_J=Yes
Set Er_J_Msg=Drive J %Local_PC_Projects% Failed to Mount
::subst J: /d >nul 2>nul
::subst J: \\%Main_Server_IP%\Projects\
timeout /t 2
)
if /i "%cls%" equ "yes" cls
set cls=none

::MOUNTING_END
Echo %Mount_Er%|findstr /i "Error"
if %errorlevel% equ 0 (
goto :Action_Mount
) >nul
goto :Mounted



:Mount_Local_Dir_old
Echo (old Method) Local Mounting 
Echo (old Method) Launching Local Keanu 
timeout /t 1
call unmount.bat
Set Mount_Type=Local_Old
cls
cd /d C:\
Set MN=0
Set reply=Old Method Launching Local Keanu
REM call reply.bat

subst K: %Local_PC_Dir%
if %errorlevel% equ 1 (
subst K: /d >nul 2>nul
subst K: %Local_PC_Dir%
)
subst H: %Local_PC_Heavy%
if %errorlevel% equ 1 (
subst H: /d >nul 2>nul
subst H: %Local_PC_Heavy%
)
subst J: %Local_PC_Projects%
if %errorlevel% equ 1 (
subst J: /d >nul 2>nul
subst J: %Local_PC_Projects%
)
Echo mounting Local Done
timeout /t 2
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
cls
if /i "%Mount_Er%" EQU "Error" (
echo Some Drived Did not Mount
timeout /t 1
)
Echo Mounted Completed
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
Echo %keanu.date.time% Caller     = %Caller% >>  %access.logs%
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



:Last
K:
cd K:\


Set Mount_Finished=Yes
Echo Mounting Done
Echo Exiting Mount
cls
timeout \t 2
:EOF
cls
