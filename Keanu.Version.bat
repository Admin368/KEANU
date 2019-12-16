@echo %Debug%
REM Set Process.Name.Default=Keanu.Version
call keanu.location.bat 2>>%access.logs%
Echo %keanu.date.time% User:%user% Support_Process [Keanu.Version] Was Called >>%access.logs%
echo %keanu.date.time% User:%user started [keanu.Version.bat] >>%access.logs%

echo %keanu.date.time% User:%user calling [keanu.prep.bat] >>%access.logs%
call keanu.prep.bat 2>>%access.logs%
echo %botname%
type keanu.version.txt
echo .................
