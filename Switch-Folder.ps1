# Define the directories
$directories = @("C:\", "D:\")

# Display the directories
Write-Host "Select a directory:"
for ($i=0; $i -lt $directories.Length; $i++) {
    Write-Host "$($i+1): $($directories[$i])"
}

# Prompt the user to select a directory
$selectedNumber = Read-Host "Enter the number of the directory you want to switch to"

# Check that the user input is a number and within the correct range
if(([int]::TryParse($selectedNumber,[ref]$selectedNumber)).GetType() -isnot [int].GetType())
{
    Write-Host "Invalid selection1($selectedNumber). Please enter a number between 1 and $($directories.Length)." 
    exit
}
if($selectedNumber -lt 1 -or $selectedNumber -gt $directories.Length)
{
    Write-Host "Invalid selection2($selectedNumber). Please enter a number between 1 and $($directories.Length)." 
    exit
}
# Change to the selected directory
Set-Location $directories[$selectedNumber - 1]
