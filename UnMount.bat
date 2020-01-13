@echo off
cd /d %local_Dir%
set E=0
Set M=0
set Mounted=0
Cd /d c:\Keanu.Config
subst
Subst >Mounted.txt

Echo Unmounting Essesntial Drives Started

:K
type Mounted.txt|findstr "K:"
if %errorlevel% equ 0 (
subst K: /d
Set K_UnMounted=1
Set /a M=M+1
goto :H
)
Set K_UnMounted=0
Set /a E=%E%+1


:H
Type Mounted.txt|findstr "H"
if %errorlevel% equ 0 (
subst H: /d
Set H_UnMounted=1
Set /a M=M+1
goto :J
)
Set H_UnMounted=0
Set /a E=%E%+1


:J
Type Mounted.txt|findstr "J"
if %errorlevel% equ 0 (
subst J: /d
Set J_UnMounted=1
Set /a M=M+1
goto :T
)
Set J_UnMounted=0
Set /a E=%E%+1

:T
Type Mounted.txt|findstr "T"
if %errorlevel% equ 0 (
subst T: /d
set T_UnMounted=1
Set /a M=M+1
goto :Rz
)
set T_UnMounted=0
Set /a E=%E%+1


:Rz
Echo E = %E% out of 4
Echo M = %M% out of 4
if /i %E%==4 Set Mounted=None
if /i %Mounted%==None (
echo No Drive Are Mounted
)
Echo UnMounting Drives Done
Echo %M% Drives Unmounted
del /f /Q Mounted.txt
cd /d %local_Dir%