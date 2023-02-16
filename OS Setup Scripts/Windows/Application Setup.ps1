Clear-Host
$host.ui.RawUI.WindowTitle = “Application Installer”
Write-Host "Installing essential packages."

# Get all essential software.
winget install --id=Brave.Brave  -e
winget install --id=Notepad++.Notepad++  -e
winget install --id=VideoLAN.VLC  -e
winget install --id=7zip.7zip  -e

# Get "Frequently used" software
Clear-Host
$inp = Read-Host "Install frequently used programs? (Y/N)"

if ($inp -like "y*") {
  Write-Output "Installing frequently used programs..."

  winget install --id=Discord.Discord  -e
  winget install --id=qBittorrent.qBittorrent  -e
  
  $inp = Read-Host "Install spotify adblocker? (y/n)"
  if ($inp -like "y*") {
    Write-Output "Installing spotify adblocker..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression "& { $((Invoke-Webrequest -useb 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content) } -new_theme"
  } else {
    Write-Output "Skipping spotify adblocker..."
    winget install --id=Spotify.Spotify  -e
  }

  # Continue to install additional programs
  winget install --id=Microsoft.PowerToys  -e
  winget install --id=Seafile.Seafile  -e
}

Clear-Host
$inp = Read-Host "Install development programs? (Y/N)"
if ($inp -like "y*") {
  Write-Output "Installing development programs..."

  winget install --id=Git.Git  -e
  winget install --id=Microsoft.VisualStudioCode  -e
  winget install --id=CoreyButler.NVMforWindows  -e
  winget install --id=Python.Python -e
}

Clear-Host
$inp = Read-Host "Install gaming programs? (Y/N)"
if ($inp -like "y*") {
  winget install --id=Valve.Steam  -e
  winget install --id=GOG.Galaxy -e
  winget install --id=EpicGames.EpicGamesLauncher  -e
}

Clear-Host
$inp = Read-Host "Linux Administration programs? (Y/N)"
if ($inp -like "y*") {
  winget install --id=TimKosse.FileZilla.Client  -e
}

Write-Host "All programs have been installed!"
Read-Host -Prompt "Press any key to restart the computer"

Restart-Computer
