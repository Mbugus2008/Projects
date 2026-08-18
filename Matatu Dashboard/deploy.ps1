# Fast deploy for Matatu Dashboard using ZIP transfer
# Usage: .\deploy.ps1
$ErrorActionPreference = "Stop"
$password = Read-Host -Prompt "Password" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential('Admin', $password)
$opts = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$sess = New-PSSession -ComputerName services.trimline.co.ke -Credential $cred -UseSSL -SessionOption $opts

try {
    Write-Host "Publishing..." -ForegroundColor Cyan
    dotnet publish "Matatu Dashboard.csproj" -c Release -o publish --no-restore | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "Build failed" }

    $zip = "$env:TEMP\dashboard-deploy.zip"
    Remove-Item $zip -Force -ErrorAction SilentlyContinue
    Compress-Archive -Path "publish\*" -DestinationPath $zip -Force

    Write-Host "Stopping app..." -ForegroundColor Cyan
    Invoke-Command -Session $sess -ScriptBlock {
        C:\Windows\System32\inetsrv\appcmd.exe stop apppool /apppool.name:MatatuDashboardPool 2>&1 | Out-Null
        Get-Process -Name dotnet -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }

    Write-Host "Copying zip..." -ForegroundColor Cyan
    Copy-Item -Path $zip -Destination "C:\Windows\Temp\dashboard-deploy.zip" -Force -ToSession $sess

    Write-Host "Extracting..." -ForegroundColor Cyan
    Invoke-Command -Session $sess -ScriptBlock {
        Expand-Archive -Path "C:\Windows\Temp\dashboard-deploy.zip" -DestinationPath "C:\WebServices\Dashboard" -Force
    }

    Write-Host "Starting..." -ForegroundColor Cyan
    Invoke-Command -Session $sess -ScriptBlock {
        C:\Windows\System32\inetsrv\appcmd.exe start apppool /apppool.name:MatatuDashboardPool 2>&1 | Out-Null
    }
    Write-Host "Done" -ForegroundColor Green
}
finally {
    Remove-PSSession $sess
}
