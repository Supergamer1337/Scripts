## How to use

To use this script, you need to run the two commands below in powershell as an administrator.

```powershell
Set-ExecutionPolicy Unrestricted
. {Invoke-Webrequest -useb https://raw.githubusercontent.com/Supergamer1337/Scripts-and-Dotfiles/main/OS%20Setup%20Scripts/Windows/install.ps1?token=GHSAT0AAAAAAB65GQ4OQEDXOAE53BU6LATCY7QXIYA} | Invoke-Expression; install
```

The first command allows the script to run, and the second commands downloads and runs the script.
