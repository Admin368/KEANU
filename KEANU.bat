@echo %Debug%
Set Process.Name=Keanu.Main

:Launcher_Variables
Set Launcher?=Yes
set Launcher=%Process.Name%
set Speech.Enable=Yes
set Keanu.Speech=ON
set FullScreen=Yes
set MQTT.Request=False
set NodeRed.Request=False
Set Loading=Yes
Set Launch_Question=No
Set MM=No
Set Fast_Keanu=No
Set Use_Admin=No
Set Use_Pre_User=No
Set Pre_User=None
call Keanu.Launcher.bat
