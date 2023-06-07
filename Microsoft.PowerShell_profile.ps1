function Select-Session { & "$env:USERPROFILE\ps\Select-Session.ps1" }
funciton Switch-Folder { & "$env:USERPROFILE\ps\Switch-Folder.ps1" }
Set-Alias -Name es -Value Select-Session
Set-Alias -Name sf -Value Switch-Folder
Set-Alias -Name np -Value notepad.exe
Set-Alias -Name npp -Value notepad++.exe