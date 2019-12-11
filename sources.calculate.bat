REM You need to use the property /a on the set command.

REM For example,

REM set /a "c=%a%+%b%"
REM This allows you to use arithmetic expressions in the set command, rather than simple concatenation.

REM Your code would then be:

@set a=3
@set b=4
@set /a "c=%a%+%b%"
echo %c%
@set /a "d=%c%+1"
echo %d%

REM and would output:
REM 7
REM 8