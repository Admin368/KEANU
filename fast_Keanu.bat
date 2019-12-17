@echo %Debug%
Set Process.Name=Keanu.Main


:Launcher_Variables
set Launcher=Keanu.Main
set Speech.Enable=NO
set Keanu.Speech=OFF
set FullScreen=Yes
set MQTT.Request=False
set NodeRed.Request=False
Set Loading=No
Set Launch_Question=No
Set MM=No
Set Fast_Keanu=Yes
Set Use_Admin=No
Set Use_Pre_User=Yes
Set Pre_User=Jey
call Keanu.Launcher.bat
