@echo off
REM Set Process.Name=keanu.logo
call Keanu.location.bat
REM type Keanu.logo.data.txt
REM type Keanu.logo.data.txt || set logo=
REM echo %logo%
Echo %keanu.date.time% User:%user% Support_Process [Keanu.Logo] Was Called >>%access.logs%
goto :logo01



:logo01
Echo :::::::::::::::::::::::::::::::::::::::::::::
Echo ::Kernel.Encoded.Artificial.Network.Unicode::
Echo :::::::::##::::::::#####:::::::#######:::::::K%random%Kernel%random%%random%
Echo :::::::####:::::::##:::##:::::::::::##:::::::E%random%Encoded%random%%random%
Echo :::::::::##:::::::##:::##::::::::::##::::::::A%random%Artificial%random%%random%
Echo :::::::::##:::::::##:::##:::::::::##:::::::::N%random%Network%random%%random%
Echo :::::::#####::::::::###::::::::::##::::::::::U%random%Unicode%random%%random%
Echo ::Kernel.Encoded.Artificial.Network.Unicode::  %BotName% %version%
Echo :::::::::::::::::::::::::::::::::::::::::::::
goto :EOF

:logo02
for /F "tokens=*" %%A in  ( Keanu.logo.data.txt) do  (
   Echo %%A
)
goto :EOF




:EOF