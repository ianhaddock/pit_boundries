:: generate simview files from Assetto Corsa install
:: v1-20240105

@ECHO OFF

TITLE 'Simview Cache Tool'

:: use local vars
setlocal

set "dest_tracks=%~dp0simview_cache\tracks"
set "dest_badge=%~dp0simview_cache\cars"
set "simview_tool_path=%~dp0SimViewTool.exe"

:: default assetto corsa installed path
set "assetto_base_path=C:\PROGRA~2\Steam\steamapps\common\assettocorsa"

:: use custom path if passed to script and valid
set ac_user_path=%~1
if exist "%ac_user_path%" ( 
    set "assetto_base_path=%ac_user_path%"
    ) 

:: get length of assetto corsa base path
call :strlen %assetto_base_path%, len

:: add chars to len to include /content/cars/
set /a "path_prefix=%len%+15"

set "simview_tracks_path=%assetto_base_path%\content\tracks"
set "simview_cars_path=%assetto_base_path%\content\cars"

:: usage
ECHO:
echo This script will build a simview_cache folder with:
echo    (1) SimViewTool.exe generated pit boundaries files
echo    (2) simview formatted car badge files.
echo:
echo You can optionally pass non standard install paths to the script:
echo  .\generate_simview_files.bat "D:\path\to\assettocorsa"
echo NOTE: do not include the trailing slash in custom paths.
echo:
echo Path selected: %assetto_base_path%
echo:
set /P YOUSURE=Proceed (Y/[N])?
if /I "%YOUSURE%" NEQ "Y" (
    echo Exiting.
    pause
    exit /B 0
)

:: check for SimViewTool.exe
if not exist "%simview_tool_path%" (
    echo:
    echo ERROR: Could not find SimViewTool.exe
    echo Download it here: https://www.racedepartment.com/downloads/simview.35249/
    echo Place SimViewTool.exe in the same directory as this script.
    echo:
    pause
    exit 1
)

:: check assetto corsa path exists
if not exist %assetto_base_path% (
    echo: 
    echo ERROR: Assetto Corsa folder not found: %assetto_base_path%
    pause
    exit 1
)

:: check for tracks destination folder
if not exist %dest_tracks% ( mkdir %dest_tracks% )

:: check for badges destination folder
if not exist %dest_badge% ( mkdir %dest_badge% )

:: generate pit boundaries
SimViewTool.exe %simview_tracks_path%

:: move generated pb files to simview_cache\tracks folder
for /R %simview_tracks_path% %%a in (*.pb) do move /Y "%%a" "%dest_tracks%"

:: search for badge images in cars directories
for /R %simview_cars_path% %%a in (ui\badge.png) do ( call :makebadge "%%a", %path_prefix% )

echo Done.
pause
exit/B 0

:makebadge
    set car_path=%1
    set path_prefix=%2
    
    ::select path after assettocorsa\ directory
    call set car_name_long=%%car_path:~%path_prefix%,-11%%
    
    :: use first directory name found as car name
    for /f "tokens=1 delims=\" %%i in ("%car_name_long%") do (set car_name=%%i)

    :: format simview badge name
    set "badge_file_name=badge_%car_name%.png"

    :: destination path
    set "dest_path=%dest_badge%\%badge_file_name%"

    :: only copy badge.png files found at first level ui/ directory
    if /i "%car_name_long%\badge.png"=="%car_name%\ui\badge.png" (
        echo Creating %badge_file_name%
        copy %car_path% "%dest_path%"
    )
    goto :eof
exit/B 0

:: from stackoverflow.com/questions/41179376
:strlen string len
SetLocal EnableDelayedExpansion
set "token=#%~1" & set "len=0"
for /L %%A in (12,-1,0) do (
    set/A "len|=1<<%%A"
    for %%B in (!len!) do if "!token:~%%B,1!"=="" set/A "len&=~1<<%%A"
)
EndLocal & set %~2=%len%
exit/B 0