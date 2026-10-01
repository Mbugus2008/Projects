$cred = Import-Clixml "$env:USERPROFILE\services-cred.xml"
$s = New-PSSession -ComputerName services.trimline.co.ke -Port 5986 -UseSSL -Credential $cred -Authentication Negotiate -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)
$out = Invoke-Command -Session $s -ScriptBlock {
  $res = @()
  $log = Get-ChildItem "C:\inetpub\logs\LogFiles\W3SVC*\u_ex260922.log" | Select-Object -First 1
  $res += "log: " + $log.FullName + "  size=" + [int]($log.Length/1MB) + "MB"
  $lines = Get-Content $log.FullName -Tail 2000
  $res += "sample line: " + ($lines | Select-Object -First 1)
  $hdr = Get-Content $log.FullName -Head 4 | Select-Object -Last 1
  $res += "header: " + $hdr
  $h = $hdr.Substring(1).Split(' ')
  $fDate = [Array]::IndexOf($h, 'date'); $fTime = [Array]::IndexOf($h, 'time'); $fUrl = [Array]::IndexOf($h, 'cs-uri-stem')
  $fStatus = [Array]::IndexOf($h, 'sc-status'); $fTaken = [Array]::IndexOf($h, 'time-taken'); $fCip = [Array]::IndexOf($h, 'c-ip')
  $res += "field indexes: url=$fUrl status=$fStatus taken=$fTaken cip=$fCip"
  $byHour = @{}; $taken = @()
  foreach($l in $lines){
    $p = $l.Split(' ')
    if($p.Count -lt 10){ continue }
    $hh = $p[$fTime].Substring(0,2)
    $u = $p[$fUrl]
    if($u -notlike "*Collect.asmx*"){ continue }
    $byHour[$hh] = 1 + [int]$byHour[$hh]
    $taken += [int]$p[$fTaken]
  }
  $res += "Collect.asmx per hour (last 2000 lines): " + (($byHour.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Name + "h=" + $_.Value }) -join "  ")
  if($taken.Count){
    $sorted = $taken | Sort-Object -Descending
    $res += ("time-taken ms: max={0} p95={1} median={2} avg={3:n0}" -f $sorted[0], $sorted[[int]($sorted.Count*0.05)], $sorted[[int]($sorted.Count/2)], ($taken | Measure-Object -Average).Average)
  }
  $res += "--- compression config ---"
  $appcmd = "$env:SystemRoot\system32\inetsrv\appcmd.exe"
  $res += (& $appcmd list config /section:system.webServer/urlCompression 2>&1 | Out-String)
  $res += (& $appcmd list config "Default Web Site" /section:system.webServer/urlCompression 2>&1 | Out-String)
  $res += (& $appcmd list config /section:system.webServer/httpCompression 2>&1 | Out-String)
  $res
}
$out | Out-String
Remove-PSSession $s
