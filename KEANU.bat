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
call Keanu.Launcher.bat
