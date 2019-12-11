@echo off
Set Process.Name.Default=keanu.Version.Log
call keanu.location.bat
echo %keanu.date.time% User:%User% Script [Keanu.Version.Log] started >>%access.logs% 2>1&	
cls

Echo %botname% %version%
Echo Printing Current Version update Log
call keanu.pause

type Keanu.Version.log.txt

echo %botname% Log Ends here
pause