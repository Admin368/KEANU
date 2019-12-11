@echo off 
    setlocal enableextensions disabledelayedexpansion

    set search=Found 
    set replace=
    set textFile=sources.delete.word.txt

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo(!line:%search%=%replace%!
        endlocal
    )