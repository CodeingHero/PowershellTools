$scripts = @(
  "./Select-Session.ps1",
  "./Switch-Folder.ps1"
)

foreach ($script in $scripts) {
  Copy-Item $script $env:USERPROFILE\ps
}

Copy-Item ./Microsoft.PowerShell_profile.ps1 -Destination $PROFILE