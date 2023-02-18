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
}

function Install-Spotify {
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