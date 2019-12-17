@echo %Debug%
call:speak "Hello ,%user%"
:begin
set /p "spk=Speak: "
call:speak "%spk%"
goto begin
:Speak
(
echo/Dim ProSpeak
echo/Set ProSpeak = WScript.CreateObject^("SAPI.SpVoice"^)
echo/ProSpeak.Speak "%~1"
) > proSpeak.vbs
echo/%~1
cscript //nologo proSpeak.vbs&del proSpeak.vbs
cls 