@echo %Debug%
REM set Process.Name=Keanu.Fullscreen
Echo Setting FullScreen
::call Keanu.location.bat
Echo %keanu.date.time% User:%user% Support_Process [Keanu.FullScreen] Was Called >>%access.logs%

:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

REm haha

:: GOTO EOF