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

# 3. Incremental mirror (only changed files; production-side settings preserved)
Write-Host '==> Copying changed files...' -ForegroundColor Cyan
$dest = "\\$Server\$RemotePath"
robocopy $publishDir $dest /MIR /XF appsettings.json appsettings.Production.json /NFL /NDL /NJH /NJS /R:2 /W:2 | Out-Host
$code = $LASTEXITCODE
if ($code -ge 8) { throw "robocopy failed with exit code $code" }

# 4. Recycle the IIS app by touching web.config (IIS restarts in-process apps on config change)
Write-Host '==> Recycling app (web.config touch)...' -ForegroundColor Cyan
(Get-Item "$dest\web.config").LastWriteTime = Get-Date

# 5. Verify
Write-Host '==> Verifying...' -ForegroundColor Cyan
Start-Sleep -Seconds 3
$resp = curl.exe -s -o NUL -w '%{http_code}' https://main.trimline.co.ke:4018/api/settings
Write-Host "API /api/settings -> HTTP $resp (401 = live and protected)" -ForegroundColor Green
