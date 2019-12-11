@echo off
net use K: \\192.168.1.168\keanu >nul 2>nul
net use H: \\192.168.1.168\keanu.Heavy >nul 2>nul
K:
cd K:\
call keanu.date.time.bat
Set Process.Name=Fast_Keanu
cls
set Access.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Access.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.logs= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.log= "H:Keanu.Access.Logs\%Keanu.date.time%.txt"
cls
set Access.Error= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Errors= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acess.Errors= "H:Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Acces.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Acess.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "H:Keanu.Aces.Logs\%Keanu.date.time%Fatal.txt"
cls
set Speech.Enable=No
set Keanu.Speech=OFF
set MQTT.Request=False
set NodeRed.Request=False
cls
call keanu.date.time >nul
call locations >nul
cls
cd K:\
Set /P User=<Keanu.Adm.txt
cls
Echo KEANU (C) 2019 107_Studios
Echo Fast_Keanu_Prompt
call Keanu.Logic.Main.bat