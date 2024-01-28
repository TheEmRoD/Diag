::@echo off
SETLOCAL
IF EXIST %1 ECHO %1
IF "%1"=="FORCE" GOTO :Install
IF EXIST type "c:\program files\teamviewer\TeamViewer15_Logfile.log" GOTO :QUIT
IF EXIST "C:\Program Files\TeamViewer\TeamViewer.exe" GOTO :Uninstall
IF EXIST "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" GOTO :Uninstall

Echo NO TV : Quit.
GOTO :QUIT

:Uninstall
REM https://github.com/williandefazio/Uninstall-TeamViewer-Batch/blob/master/Uninstall_TeamViewer.bat
tasklist /FI "IMAGENAME eq TeamViewer.exe" 2>NUL | find /I /N "TeamViewer.exe">NUL
if "%ERRORLEVEL%"=="0" (GOTO :KILL) ELSE (GOTO :REMOVEMSI)

:KILL
taskkill /f /im TeamViewer.exe
TIMEOUT 2
GOTO :REMOVEMSI

:REMOVEMSI
wmic product where vendor="TeamViewer"
if not "%errorlevel%"=="0" GOTO :CHECKOS
for /f "tokens=2 delims==" %%f in ('wmic product Where "vendor like 'TeamViewer'" get IdentifyingNumber /value ^| find "="') do set "id=%%f"
msiexec.exe /x "%id%" /qn
GOTO :Install

:Install

REM *******************************************************************************
REM ************************* DEPLOIEMENT DE TEAMVIEWER 15 ************************
REM *******************************************************************************

cd "%~dp0"
IF EXIST "%~dp0\TeamViewer_Host.zip" DEL /Q /F "%~dp0TeamViewer_Host.zip"
IF EXIST "%~dp0\Host" rd /Q /S "%~dp0Host"
IF EXIST "%~dp0\Full" rd /Q /S "%~dp0Full"

IF EXIST %SystemRoot%\system32\curl.exe curl.exe -fSLo "%~dp0TeamViewer_Host.zip" "https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI64.zip"
IF NOT EXIST %SystemRoot%\system32\curl.exe bitsadmin.exe /transfer "TV" https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI64.zip "%~dp0\TeamViewer_Host.zip"
IF NOT EXIST "%~dp0TeamViewer_Host.zip" Invoke-WebRequest -Uri "https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI64.zip" -OutFile "%~dp0TeamViewer_Host.zip"

powershell Expand-Archive -Path """%~dp0TeamViewer_Host.zip""" -DestinationPath """%~dp0"" -force"
start /wait msiexec.exe /passive /norestart /i  "%~dp0Host\TeamViewer_Host.msi" /qn DESKTOPSHORTCUTS=0 CUSTOMCONFIGID=6vqtzpn APITOKEN=22841762-iM9NxwMlx1b0IDp5fQRI

TIMEOUT 5


IF EXIST "C:\Program Files\TeamViewer\TeamViewer.exe" "C:\Program Files\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
IF EXIST "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
TIMEOUT 2

IF EXIST "C:\Program Files\TeamViewer\TeamViewer.exe" "C:\Program Files\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
IF EXIST "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
TIMEOUT 2

IF EXIST "%~dp0TeamViewer_Host.zip" DEL /Q /F "%~dp0TeamViewer_Host.zip"
IF EXIST "%~dp0Host" rd /Q /S "%~dp0\Host"
IF EXIST "%~dp0Full" rd /Q /S "%~dp0\Full"

TIMEOUT 5

IF EXIST "C:\Program Files\TeamViewer\TeamViewer.exe" "C:\Program Files\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
IF EXIST "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=

:QUIT
DEL /Q /F "%~f0"
exit
