@cls
@title Application Installer
@echo off
echo Installing essential packages.

:: Get all essential software.
winget install Brave
winget install Notepad++
winget install VLC
winget install Python
winget install 7-Zip

:: Get "Frequently used" software
cls
echo Install frequently used programs (communication, gaming, entertainment, etc...)? (Y/N)
set INPUT=
set /P INPUT=%=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no

:yes
winget install Discord
winget install QBittorrent
winget install Spotify
:: Get SpotMeDown setup here
winget install Steam

:no
