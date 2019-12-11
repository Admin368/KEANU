$vlc = "C:\XP\VideoLAN\VLC\vlc.exe"
$file = "C:\XP\Start arcade\Intro.avi"
$file = " """ & $file & """"   ;because of the blanks in the path

$test = Run ($vlc & $file)
Sleep(300)   ;wait for VLC to be "really" opened
Send ("f")   ;set fullscreen

Sleep(14500)   ;wait for the video to be played
RunWait(@ComSpec & " /c " & 'taskkill /IM VLC.exe /T /F', "", @SW_HIDE)   ;close VLC

Run ("C:\XP\Start.exe")   ;run my programm

Exit