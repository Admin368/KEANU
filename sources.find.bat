echo %variables% | find "1" > nul
if %errorlevel%==0 (
    echo The string is found
) else (
    echo The string is not found
)