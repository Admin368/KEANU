(
echo/Dim ProSpeak
echo/Set ProSpeak = WScript.CreateObject^("SAPI.SpVoice"^)
echo/ProSpeak.Speak "Fuck You"
) > Keanu.Speech.Engine.Call.Temp.vbs
cscript //nologo Keanu.Speech.Engine.Call.Temp.vbs&del Keanu.Speech.Engine.Call.Temp.vbs
