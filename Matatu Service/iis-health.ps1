$cred = Import-Clixml "$env:USERPROFILE\services-cred.xml"
$s = New-PSSession -ComputerName services.trimline.co.ke -Port 5986 -UseSSL -Credential $cred -Authentication Negotiate -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)
$out = Invoke-Command -Session $s -ScriptBlock {
  $res = @()
  $procs = Get-Process w3wp -ErrorAction SilentlyContinue
  foreach($p in $procs){
    $res += "w3wp pid={0} cpu={1:n1}s mem={2:n0}MB threads={3} start={4}" -f $p.Id, $p.CPU, ($p.WorkingSet64/1MB), $p.Threads.Count, $p.StartTime
  }
  # request queue + worker processes
  $appcmd = "$env:SystemRoot\system32\inetsrv\appcmd.exe"
  $res += "--- appcmd list wp ---"
  $res += (& $appcmd list wp 2>&1 | Out-String)
  $res += "--- counters ---"
  foreach($c in @('\HTTP Service Request Queues(_Total)\CurrentQueueSize','\Web Service(_Total)\Current Connections','\Web Service(_Total)\Total Method Requests/sec','\Process(w3wp*)\% Processor Time')){
    try { $sample = Get-Counter $c -MaxSamples 1 -ErrorAction Stop; $res += ($c + " = " + ($sample.CounterSamples | ForEach-Object { "{0:n1}" -f $_.CookedValue }) -join ", ") } catch { $res += ($c + " = n/a") }
  }
  # recent IIS log volume for the Metro app
  $logs = Get-ChildItem "C:\inetpub\logs\LogFiles\W3SVC*\*.log" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 2
  foreach($l in $logs){
    $tail = Get-Content $l.FullName -Tail 400 -ErrorAction SilentlyContinue
    $metro = $tail | Where-Object { $_ -like "*Collect.asmx*" }
    $res += ("log " + $l.Name + ": last400 lines, Collect.asmx hits=" + @($metro).Count)
    $took = $metro | ForEach-Object { $p = $_ -split ' '; [int]$p[-1] } | Where-Object { $_ -gt 0 } | Sort-Object -Descending | Select-Object -First 5
    $res += ("  slowest time-taken (ms): " + ($took -join ", "))
    $codes = $metro | ForEach-Object { $p = $_ -split ' '; $p[8] } | Group-Object | Sort-Object Count -Descending | Select-Object -First 5
    $res += ("  status codes: " + (($codes | ForEach-Object { $_.Name + " x" + $_.Count }) -join ", "))
  }
  $res
}
$out | Out-String
Remove-PSSession $s
