@echo %Debug%
REM Set Process.Name=Keanu.Date.Time

REM #### time Variables #####
set Year=%date:~10,4%
set Month=%date:~4,2%
set Day=%date:~7,2%
set Hour=%time:~0,2%
if %Hour% lss 10 (set CUR_HH=0%time:~1,1%)

set Minutes=%time:~3,2%
set Seconds=%time:~6,2%
set Nano.Seconds=%time:~9,2%


Rem set Keanu.Date.Time=%Year%_%Month%_%Day%-%Hour%;%Minutes%_%Seconds%
REm set Keanu.Time.Date=%Year%_%Month%_%Day%-%Hour%;%Minutes%_%Seconds%
set Keanu.Date.Time=%Year%(%Month%_%Day%-%Hour%;%Minutes%_%Seconds%)
set Keanu.Time.Date=%Year%(%Month%_%Day%-%Hour%;%Minutes%_%Seconds%)


set Keanu.Date=%Year%_%Month%_%Day%
set Keanu.Time=%Hour%;%Minutes%_%Seconds%
