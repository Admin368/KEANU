(
echo/Dim ProSpeak
echo/Set ProSpeak = WScript.CreateObject^("SAPI.SpVoice"^)
echo/ProSpeak.Speak "Fuck Off"
) > Keanu.Speech.Engine.Temp.vbs
cscript //nologo Keanu.Speech.Engine.Temp.vbs&del Keanu.Speech.Engine.Temp.vbs
