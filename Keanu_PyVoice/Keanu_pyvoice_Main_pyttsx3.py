import pyttsx3
speech_pyttx3 = pyttsx3.init()
engine =speech_pyttx3

# Voice IDs pulled from engine.getProperty('voices')
# These will be system specific
voice_zira = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_EN-US_ZIRA_11.0"
voice_russia = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_RU-RU_IRINA_11.0"
voice_david = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_EN-US_DAVID_11.0"
# Use female English voice
engine.setProperty('voice', voice_zira)
engine.setProperty('rate',150)
engine.setProperty('volume', 1.0)
engine.say('Good Morning')

# Use female Russian voice
# engine.setProperty('voice', ru_voice_id)
# engine.say('Привет. где хакер')

engine.runAndWait()