Import-Module WebAdministration

$siteName = "Default Web Site"
$appName  = "Aps"
$physPath = "C:\inetpub\wwwroot\Aps"
$pool     = "DefaultAppPool"

# Ensure the app pool is set to No Managed Code (required for ASP.NET Core)
Set-ItemProperty "IIS:\AppPools\$pool" managedRuntimeVersion ""

$existing = Get-WebApplication -Site $siteName -Name $appName -ErrorAction SilentlyContinue
if ($existing) {
    Write-Host "/Aps already exists — updating physical path."
    Set-ItemProperty "IIS:\Sites\$siteName\$appName" physicalPath $physPath
} else {
    Write-Host "Creating /Aps virtual application..."
    New-WebApplication -Site $siteName -Name $appName -PhysicalPath $physPath -ApplicationPool $pool
}

# Restart the app pool to pick up new binaries
Restart-WebAppPool -Name $pool
Write-Host "Done. App pool '$pool' restarted."
Get-WebApplication -Site $siteName | Select-Object Path, PhysicalPath | Format-Table -AutoSize
