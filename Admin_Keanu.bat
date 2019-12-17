@echo %Debug%
Set Process.Name=Keanu.Main


:Launcher_Variables
set Launcher=Keanu.Main
set Speech.Enable=NO
set Keanu.Speech=OFF
set FullScreen=Yes
set MQTT.Request=False
set NodeRed.Request=False

:Launcher_Essentials
title %Launcher% %Keanu_Name% %version%
echo %keanu.date.time% %Launcher% calling [KeanuLocation.bat] >>%access.logs%
call location.bat


:Launcher_Log
echo %keanu.date.time% Launcher started [%launcher%] >>%access.logs%



:Launcher_Main
cls
cd K:\
Set /P User=<Keanu.Adm.txt
cls
Echo KEANU (C) 2019 107_Studios
Echo Fast_Keanu_Prompt
call Keanu.Logic.Main.bat