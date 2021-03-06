@echo %Debug%
set Caller=%Process.Name%
set Process.Name=Keanu.Mount_Essesntials
set Mount_Used=Yes


:Mount_Essesntials
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
echo
Echo Checking if in home Network
Echo Checking if in home Network >>%access.logs%

Netsh WLAN show interfaces >Temp.Ip.txt
>nul type Temp.ip.txt|findstr /i "%Home_SSID%"
if %errorlevel% equ 0 (

)

net share 
net use K: \\127.0.0.1\keanu >nul 2>nul
net share
net use H: \\127.0.0.1\keanu.Heavy >nul 2>nul
net share
net use J: \\127.0.0.1\keanu\Projects\Django.Dev >nul 2>nul

REM net share Keanu=%Local_Dir% /GRANT:Everyone,FULL
K:
cd K:\

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
