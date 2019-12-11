SETLOCAL EnableDelayedExpansion
set x=Run
FOR /f "delims=" %%a IN (Input_sources.delete.word.txt) DO (
    set b=%%a
    echo !b:%x%=!
)