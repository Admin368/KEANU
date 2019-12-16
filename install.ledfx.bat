@echo %Debug%
set
set Process.Name=Install.Ledfx
Echo %keanu.date.time% User:%user% Install_Process [Install.Ledfx] Was Started >>%access.logs%
call keanu.location.bat


:Phase01

echo installing Dependencies For Keanu Led protocol
pause



echo Procedure 1/8 [Keanu.Protocol.ledfx-installation]
echo creating environment
call install.ledfx.procedure_1.bat
echo make sure no errors occured
pause




echo Procedure 2/8 [Keanu.Protocol.ledfx-installation]
echo activating environment
call install.ledfx.procedure_2.bat
echo make sure no errors occured
pause




echo Procedure 3/8 [Keanu.Protocol.ledfx-installation]
echo installing "numpy" python Dependencies
call install.ledfx.procedure_3.bat
echo make sure no errors occured
pause



echo Procedure 4/8 [Keanu.Protocol.ledfx-installation]
echo installing "scipy" python Dependencies
call install.ledfx.procedure_4.bat
echo make sure no errors occured
pause

echo Procedure 5/8 [Keanu.Protocol.ledfx-installation]
echo installing "pyqtgraph" python Dependencies
call install.ledfx.procedure_5.bat
echo make sure no errors occured
pause

echo The following dependecy is very Important
echo make sure it installs
echo if it does not install use the
echo counter-command [PlanB] option
pause




echo Procedure 6/8 [Keanu.Protocol.ledfx-installation]
echo installing "pipwin" python Dependencies
call install.ledfx.procedure_6.bat
echo make sure no errors occured
pause



goto :phase02


:phase02
Echo Keanu: Did "Procedure 6" install without errors?
Echo [Yes/No]?
echo "Exit" to Exit
set /P c=What Should i Do?:
if /I "%c%" EQU "Yes" goto :Done
if /I "%c%" EQU "Y" goto :Done
if /I "%c%" EQU "No" goto :PlanB
if /I "%c%" EQU "N" goto :PlanB
if /I "%c%" EQU "Exit" goto :Exit
if /I "%c%" EQU "E" goto :Exit
goto phase02




:PlanB
echo Procedure 6 Failed
echo Procedure 7/8 [Keanu.Protocol.ledfx-installation]
echo installing  Dependencies
call install.ledfx.procedure_7.bat
echo make sure no errors occured
pause


echo Procedure 8/8 [Keanu.Protocol.ledfx-installation]
echo installing  Dependencies
call install.ledfx.procedure_8.bat
echo make sure no errors occured
pause
goto :Done


:Done
echo Procedures "7" & "8" will not necessarly
echo [Keanu.Protocol.ledfx-installation] is completed
echo You can now use Keanu-Ledfx-Protocol
keanu.bat


:Exit
keanu.exit.bat







