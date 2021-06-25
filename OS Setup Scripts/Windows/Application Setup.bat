@cls
@title Application Installer
@echo off
echo Installing essential packages.

:: Get all essential software.
winget install Brave
winget install Notepad++
winget install VLC
winget install 7-Zip

:: Get "Frequently used" software
cls
echo Install frequently used programs? (Y/N)
set INPUT=
set /P INPUT=%=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no

:yes
winget install Discord
winget install QBittorrent
winget install Spotify
:: TODO: Get SpotMeDown setup here
winget install Steam
winget install PowerToys
winget install Seafile

:no
cls
echo Install development programs? (Y/N)
set INPUT=
set /P INPUT=%=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no

:yes
winget install Git
winget install -q "Microsoft Visual Studio Code"
winget install "Node.js LTS"
winget install Python


:no
cls
echo All programs have been installed!
pause
