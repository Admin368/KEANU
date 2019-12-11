@echo off
call keanu.location.bat
echo Process [Keanu.Backup] User:%user% %keanu.date% %keanu.time% >>%access.logs%

call Keanu.Backup.list.bat
call Keanu.Backup.Destinations.bat

Echo Keanu Backup of %version%
Echo Proceed to Backup


set backup=%Keanu.Date.Time%


goto :BackupLocation01

:BackupDestination01

mkdir C:\keanu.backup\"%backup%"

copy "%backup.Dir.Default%" "C:\keanu.backup\%backup%" 

copy "%backup.Dir.02%" "C:\keanu.backup\%backup%"

copy "%backup.Dir.03%" "C:\keanu.backup\%backup%"

copy "%backup.Dir.04%" "C:\keanu.backup\%backup%"

copy "%backup.Dir.05%" "C:\keanu.backup\%backup%"

::copy /Y C:\Keanu\*.* C:\keanu.backup\%backup% >Keanu.%backup%.txt 2>Keanu.%backup%.errors.txt