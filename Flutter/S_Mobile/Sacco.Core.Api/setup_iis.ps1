Import-Module WebAdministration

$siteName = "Sacco.Core.Api"
$port     = 8088
$physPath = "D:\Web Services\Core Api"
$poolName = "Sacco.Core.Api"

# Ensure physical path exists
if (-not (Test-Path $physPath)) {
    New-Item -ItemType Directory -Path $physPath -Force | Out-Null
    Write-Host "Created directory: $physPath"
}

# Create or update the app pool
$pool = Get-IISAppPool -Name $poolName -ErrorAction SilentlyContinue
if (-not $pool) {
    Write-Host "Creating app pool '$poolName'..."
    New-WebAppPool -Name $poolName
}
Set-ItemProperty "IIS:\AppPools\$poolName" managedRuntimeVersion ""

# Create or update the site on port 8088
$existingSite = Get-Website -Name $siteName -ErrorAction SilentlyContinue
if ($existingSite) {
    Write-Host "Site '$siteName' already exists - updating binding and physical path."
    Set-ItemProperty "IIS:\Sites\$siteName" physicalPath $physPath
    Set-WebBinding -Name $siteName -BindingInformation "*:$($port):" -PropertyName Port -Value $port
} else {
    Write-Host "Creating site '$siteName' on port $port..."
    New-Website -Name $siteName -PhysicalPath $physPath -ApplicationPool $poolName -Port $port
}

# Restart the app pool to pick up new binaries
Restart-WebAppPool -Name $poolName
Write-Host "Done. Site '$siteName' running on http://localhost:$port/"
Write-Host "App pool '$poolName' restarted."
Get-Website -Name $siteName | Select-Object Name, State, PhysicalPath | Format-Table -AutoSize
