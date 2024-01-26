::@echo off
SETLOCAL
REM *******************************************************************************
REM ************************* DEPLOIEMENT DE TEAMVIEWER 15 ************************
REM *******************************************************************************

cd "%~dp0"
REM bitsadmin.exe /transfer "TV" https://dl.teamviewer.com/download/version_15x/TeamViewer_MSI32.zip "%~dp0\TeamViewer_Host.zip"
powershell Expand-Archive -Path """%~dp0TeamViewer_Host.zip""" -DestinationPath """%~dp0"""
pause
msiexec.exe /passive /norestart /i Host\TeamViewer_Host.msi /qn DESKTOPSHORTCUTS=0 CUSTOMCONFIGID=6vqtzpn APITOKEN=22841762-iM9NxwMlx1b0IDp5fQRI
PING localhost -n 6 >NUL

"C:\Program Files (x86)\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
PING localhost -n 6 >NUL

IF EXIST "%~dp0\TeamViewer_Host.zip" DEL /Q /F "%~dp0\TeamViewer_Host.zip"
IF EXIST "%~dp0\Host" rd /Q /S "%~dp0\Host"
IF EXIST "%~dp0\Full" rd /Q /S "%~dp0\Full"

PING localhost -n 6 >NUL
:QUIT
DEL /Q /F "%~f0"
exit
