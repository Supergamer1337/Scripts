function Install-Essentials {
  winget install --id=Brave.Brave  -e
  winget install --id=Notepad++.Notepad++  -e
  winget install --id=VideoLAN.VLC  -e
  winget install --id=7zip.7zip  -e
}

function Install-Frequently-Used {
  winget install --id=Discord.Discord  -e
  winget install --id=qBittorrent.qBittorrent  -e
  winget install --id=Microsoft.PowerToys  -e
  winget install --id=Seafile.Seafile  -e
  winget install --id=plex.Plex  -e
  winget install --id=Spotify.Spotify  -e

  $inp = Read-Host "Install spotify adblocker? (y/n)"
  if ($inp -like "y*") {
    Write-Output "Installing spotify adblocker..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression "& { $((Invoke-Webrequest -useb 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content) } -new_theme"
  } else {
    Write-Output "Skipping spotify adblocker..."
  }
}

function Install-Development {
  winget install --id=Git.Git  -e
  winget install --id=Microsoft.VisualStudioCode  -e
  winget install --id=CoreyButler.NVMforWindows  -e
  winget install --id=Python.Python -e
}

function Install-Gaming {
  winget install --id=Valve.Steam  -e
  winget install --id=GOG.Galaxy -e
  winget install --id=EpicGames.EpicGamesLauncher  -e
  winget install --id=mtkennerly.ludusavi  -e
}

function Install-Linux-Admin {
  winget install --id=TimKosse.FileZilla.Client  -e
}

function Install-Section {
  param(
    [string]$sectionName,
    [string]$sectionInstallFunction
  )

  Clear-Host
  $inp = Read-Host "Install $sectionName programs? (Y/N)"
  if ($inp -like "y*") {
    Write-Output "Installing $sectionName programs..."
    Write-Output "Running $sectionInstallFunction"
    &$sectionInstallFunction
  }
}

Clear-Host
Write-Host "Activating Winget"
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

Write-Host "Installing essential packages."

Install-Essentials

Install-Section 'frequently used' Install-Frequently-Used

Install-Section 'development' Install-Development

Install-Section 'gaming' Install-Gaming

Install-Section 'linux admin' Install-Linux-Admin

Write-Host "All programs have been installed!"
Read-Host -Prompt "Press any key to restart the computer"

Restart-Computer