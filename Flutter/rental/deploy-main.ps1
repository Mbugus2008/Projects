# Deploys the RentalAdmin API to main.trimline.co.ke (C:\Services\Rental).
#
# Usage:
#   .\deploy-main.ps1                      # publish + incremental copy + recycle
#   .\deploy-main.ps1 -ServerPassword 'x'  # (re)connect the SMB session first
#
# Server facts (see repo memory for full details):
#   IIS site "Rental" -> C:\Services\Rental, HTTPS :4018 (Let's Encrypt cert, CN=main.trimline.co.ke)
#   API:  https://main.trimline.co.ke:4018/api   DB: SQL default instance, RentalDb (login RentalApp)
#   appsettings.Production.json + appsettings.json on the server hold production values and are
#   EXCLUDED from this script's mirror so deploys never overwrite them.

param(
    [string]$Server = 'main.trimline.co.ke',
    [string]$ServerUser = 'Administrator',
    [string]$ServerPassword = '',
    [string]$RemotePath = 'C$\Services\Rental'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$project = Join-Path $repoRoot 'RentalAdmin'
$publishDir = Join-Path $repoRoot 'publish'

# 1. Publish (Release)
Write-Host '==> Publishing API (Release)...' -ForegroundColor Cyan
dotnet publish $project -c Release -o $publishDir | Select-Object -Last 3 | Out-Host

# 2. Ensure SMB session (uses existing session if already connected)
$share = "\\$Server\C$"
if ($ServerPassword) {
    cmd /c "net use $share /delete /y" 2>$null | Out-Null
    cmd /c "net use $share /user:$ServerUser $ServerPassword" | Out-Host
}
if (-not (Test-Path $share)) {
    throw "No SMB session to $Server. Re-run with -ServerPassword, e.g.: .\deploy-main.ps1 -ServerPassword '<your password>'"
}

# 2b. Stop the app pool so in-process hosting releases Rental.dll before the mirror
$remoteCred = $null
if ($ServerPassword) {
    $secure = ConvertTo-SecureString $ServerPassword -AsPlainText -Force
    $remoteCred = New-Object System.Management.Automation.PSCredential($ServerUser, $secure)
}
if ($remoteCred) {
    Write-Host '==> Stopping app pool...' -ForegroundColor Cyan
    Invoke-Command -ComputerName $Server -Credential $remoteCred -ScriptBlock {
        Import-Module WebAdministration
        $pool = (Get-Item 'IIS:\Sites\Rental').applicationPool
        Stop-WebAppPool -Name $pool -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }
}

# 3. Incremental mirror (only changed files; production-side settings preserved)
Write-Host '==> Copying changed files...' -ForegroundColor Cyan
$dest = "\\$Server\$RemotePath"
robocopy $publishDir $dest /MIR /XF appsettings.json appsettings.Production.json /NFL /NDL /NJH /NJS /R:2 /W:2 | Out-Host
$code = $LASTEXITCODE
if ($code -ge 8) { throw "robocopy failed with exit code $code" }

# 4. Recycle the IIS app by touching web.config (IIS restarts in-process apps on config change)
Write-Host '==> Recycling app (web.config touch)...' -ForegroundColor Cyan
(Get-Item "$dest\web.config").LastWriteTime = Get-Date

# 4b. Restart the app pool we stopped before the copy
if ($remoteCred) {
    Write-Host '==> Starting app pool...' -ForegroundColor Cyan
    Invoke-Command -ComputerName $Server -Credential $remoteCred -ScriptBlock {
        Import-Module WebAdministration
        Start-WebAppPool -Name 'Rental'
        Start-Sleep -Seconds 4
    }
}

# 5. Verify (401 = live and protected). Loopback via WinRM when creds are available,
#    because this dev machine's curl cannot reach the 443 binding.
Write-Host '==> Verifying...' -ForegroundColor Cyan
if ($remoteCred) {
    $code = Invoke-Command -ComputerName $Server -Credential $remoteCred -ScriptBlock {
        $req = [System.Net.HttpWebRequest]::Create('https://main.trimline.co.ke:4018/api/settings')
        $req.Timeout = 15000
        try { $r = $req.GetResponse(); [int]$r.StatusCode; $r.Close() }
        catch [System.Net.WebException] { if ($_.Exception.Response) { [int]$_.Exception.Response.StatusCode } else { -1 } }
    }
} else {
    Start-Sleep -Seconds 3
    $code = curl.exe -s -o NUL -w '%{http_code}' https://main.trimline.co.ke:4018/api/settings
}
Write-Host "API /api/settings -> HTTP $code (401 = live and protected)" -ForegroundColor Green
