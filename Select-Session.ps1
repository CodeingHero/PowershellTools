# Define credentials
$creds = @{
  "hostNameOrIp" = New-Object System.Management.Automation.PSCredential ("Administrator", (ConvertTo-SecureString "password" -AsPlainText -Force));
  "ipOrHostName" = New-Object System.Management.Automation.PSCredential ("uniad", (ConvertTo-SecureString "password" -AsPlainText -Force));
}

# Display the available servers
for ($i = 0; $i -lt $creds.Keys.Count; $i++) {
  Write-Output ("Host " + ($i + 1) + ": " + $($creds.Keys)[$i])
}

# Ask the user to select a server
$selectedOption = Read-Host -Prompt "Enter the number of the server you want to connect to"

if ($selectedOption -ge 1 -and $selectedOption -le $creds.Keys.Count) {
  # Get the selected server and credential
  $selectedServer = $($creds.Keys)[$selectedOption - 1]
  $selectedCredential = $creds[$selectedServer]

  # Create and enter the session
  try {
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value $selectedServer -Force
    $session = New-PSSession -ComputerName $selectedServer -Credential $selectedCredential -ErrorAction Stop
    Invoke-Command -Session $session -ScriptBlock { Set-Location C:\ } -ErrorAction Stop
    Enter-PSSession -Session $session -ErrorAction Stop
  }
  catch {
    Write-Host "Failed to establish a session with the server: $_" -ForegroundColor Red -BackgroundColor White
    exit
  }
} else {
  Write-Error "Invalid selection. Please select a valid server number."
}
