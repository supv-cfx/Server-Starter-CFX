:MENU_START
@echo off
cls
rem Write your path here to the folder where you have the FXServer.exe
set PATH_FX_SERVER=%PATH_FX_SERVER%;C:\CHANGE_PATH_HERE
rem Write your path here to the folder where you have the cache folder
set PATH_CACHE=%PATH_CACHE%;C:\CHANGE_PATH_HERE\cache\files
set INPUT=false
set "MENU_OPTION="
set "OPTION1_INPUT="
set "OPTION2_INPUT="
echo +===============================================+
echo . BATCH START - My Server CFX                   .
echo +===============================================+
echo .                                               .
echo .  1) Start Server                              .
echo .  2) Clear Cache - Start Server                .
echo .  3) QUIT                                      .
echo .                                               .
echo +===============================================+

set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %INPUT%==false GOTO DEFAULT

:OPTION1
set INPUT=true
cd %PATH_FX_SERVER%
cmd /k FXServer.exe
timeout 2 > NUL
GOTO MENU_START

:OPTION2
set INPUT=true
del /s /q %PATH_CACHE%
cd %PATH_FX_SERVER%
cmd /k FXServer.exe
timeout 2 > NUL
GOTO MENU_START

:OPTION3
set INPUT=true
echo See you soon
timeout 2 > NUL
exit /b

:DEFAULT
echo Option not available
timeout 2 > NUL
GOTO MENU_START