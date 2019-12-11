@echo off
net use K: \\192.168.1.168\keanu >nul 2>nul
K:
cd K:\
call keanu.date.time.bat
Set Process.Name=Fast_Keanu
cls
set Access.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Access.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acess.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.logs= "Keanu.Access.Logs\%Keanu.date.time%.txt"
set Acces.log= "Keanu.Access.Logs\%Keanu.date.time%.txt"
cls
set Access.Error= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Errors= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Acess.Errors= "Keanu.Access.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Acces.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Acess.Logs\%Keanu.date.time%Fatal.txt"
set Access.Error= "Keanu.Aces.Logs\%Keanu.date.time%Fatal.txt"
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
Set /P User=Jey
cls
Echo KEANU (C) 2019 107_Studios
Echo Fast_Keanu_Prompt
call Keanu.Logic.Main.bat