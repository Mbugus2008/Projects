$cred = Import-Clixml "$env:USERPROFILE\services-cred.xml"
$s = New-PSSession -ComputerName services.trimline.co.ke -Port 5986 -UseSSL -Credential $cred -Authentication Negotiate -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)
$out = Invoke-Command -Session $s -ScriptBlock {
  $res = @()
  $log = "C:\inetpub\logs\LogFiles\W3SVC1\u_ex260922.log"
  $lines = Get-Content $log -Tail 3000
  $perMin = @{}; $perUrl = @{}; $slow = @()
  $lastHour = (Get-Date).AddHours(-1).ToString("HHmmss")
  foreach($l in $lines){
    $p = $l.Split(' ')
    if($p.Count -lt 18){ continue }
    $t = $p[1]; $u = $p[4]; $taken = [int]$p[17]
    if($t -lt $lastHour){ continue }
    $key = $t.Substring(0,4); # HHmm bucket -> per minute
    $perMin[$key] = 1 + [int]$perMin[$key]
    $short = $u -replace '^/Metro/Collect\.asmx/',''
    $perUrl[$short] = 1 + [int]$perUrl[$short]
    if($taken -gt 10000){ $slow += ($t.Substring(0,6) + " " + $short + " " + [int]($taken/1000) + "s") }
  }
  $res += "requests in the last hour (from the log tail):"
  $res += "  per minute: " + (($perMin.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Name + "=" + $_.Value }) -join "  ")
  $res += "  by endpoint: " + (($perUrl.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 12 | ForEach-Object { $_.Name + " x" + $_.Value }) -join "   ")
  $res += "  requests slower than 10s: " + @($slow).Count
  $res += "  " + (($slow | Select-Object -First 10) -join " | ")
  $res
}
$out | Out-String
Remove-PSSession $s
