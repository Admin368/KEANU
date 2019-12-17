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
Set Use_Admin=Yes
Set Use_Pre_User=No
Set Pre_User=None
call Keanu.Launcher.bat
