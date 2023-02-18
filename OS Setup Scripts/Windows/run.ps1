Import-Module './app-installs.ps1'

Clear-Host
$host.ui.RawUI.WindowTitle = “Application Installer”

Write-Host "Activating Winget"
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

Write-Host "Installing essential packages."

Install-Essentials

Clear-Host
$inp = Read-Host "Install frequently used programs? (Y/N)"

if ($inp -like "y*") {
  Write-Output "Installing frequently used programs..."

  Install-Frequently-Used
  Install-Spotify
}

Clear-Host
$inp = Read-Host "Install development programs? (Y/N)"
if ($inp -like "y*") {
  Write-Output "Installing development programs..."
  Install-Development
}

Clear-Host
$inp = Read-Host "Install gaming programs? (Y/N)"
if ($inp -like "y*") {
  Install-Gaming
}

Clear-Host
$inp = Read-Host "Linux Administration programs? (Y/N)"
if ($inp -like "y*") {
  Install-Linux-Admin
}

Write-Host "All programs have been installed!"
Read-Host -Prompt "Press any key to restart the computer"

Restart-Computer
