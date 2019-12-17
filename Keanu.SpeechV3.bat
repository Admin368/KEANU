@echo %Debug%
REM Set Process.Name=keanu.SpeechV3
REM call Keanu.location.bat


:start
set text=hi %user%,Welcome.
goto :Writes



:Ask
set /P text=Wat to say?
goto :Write
del temp.vbs
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp.vbs"
REM set text=Hello, this is a talking batch file.
echo speech.speak "%text%" >> "temp.vbs"
start temp.vbs
goto :start


:Write
(
echo/Dim ProSpeak
echo/Set ProSpeak = WScript.CreateObject^("SAPI.SpVoice"^)
echo/ProSpeak.Speak "%text%"
) > proSpeak.vbs
cscript //nologo proSpeak.vbs&del proSpeak.vbs
goto :Ask