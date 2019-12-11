set /P _file=Enter filename^>
set /P _word1=Enter the word to be canceled or replaced^>
set /P _word2=Type the word for replacement or press Enter^>

type nul > "%_file%.tmp"
for /F "delims=" %%i in ('type "%_file%"') do (
 set row=%%i
 set row=!row:%_word1%=%_word2%!
  echo.!row!
) >> "%_file%.tmp"
move "%_file%.tmp" "%_file%"