# Extract NEW FLEET ALLOCATION PERFORMANCE LIST.xlsx -> fleet-targets.json
$src = "c:\Users\mbugu\OneDrive\Desktop\NEW FLEET ALLOCATION PERFORMANCE LIST.xlsx"
$out = "D:\Projects\Matatu Service\fleet-targets.json"
$sheetNames = @("KENCOM - AMENDED", "MWIKI KIKUYU-IMENTI", "KIAMBU", "UTAWALA")

function Num($s) {
    $t = ($s -replace '[^0-9\.]', '')
    if ($t -eq '' ) { return 0 }
    return [double]$t
}

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false; $excel.DisplayAlerts = $false
$wb = $excel.Workbooks.Open($src, 0, $true)

$groups = @()
foreach ($sn in $sheetNames) {
    $ws = $wb.Worksheets.Item($sn)
    $rows = $ws.UsedRange.Rows.Count
    $cols = $ws.UsedRange.Columns.Count
    $hdrRow = -1; $col0 = -1; $title = $sn; $staff = ""
    for ($r = 1; $r -le [Math]::Min(15, $rows); $r++) {
        for ($c = 1; $c -le $cols; $c++) {
            $t = $ws.Cells.Item($r, $c).Text.Trim()
            if ($t -eq 'NO') {
                $nxt = $ws.Cells.Item($r, $c + 1).Text.Trim()
                if ($nxt -like 'FLEET*') { $hdrRow = $r; $col0 = $c }
            }
            if ($t -like 'ROUTE*' -and $hdrRow -eq -1) { $title = $t }
            if ($t -like 'ALLOCATED STAFF*' -and $hdrRow -eq -1) { $staff = ($t -replace '^ALLOCATED STAFFS?:?\s*', '') }
        }
    }
    if ($hdrRow -lt 0) { throw "header not found in $sn" }
    $vehicles = @()
    for ($r = $hdrRow + 1; $r -le $rows; $r++) {
        $no = $ws.Cells.Item($r, $col0).Text.Trim()
        if ($no -notmatch '^\d+$') { continue }   # skip blanks / TOTAL rows anywhere
        $fc = $ws.Cells.Item($r, $col0 + 1).Text.Trim()
        if ($fc -eq '') { continue }
        $parts = @($fc -split '\s*-\s*' | Where-Object { $_ -ne '' })
        $fleet = $parts[0].Trim(); $plate = if ($parts.Count -gt 1) { $parts[1].Trim() } else { "" }
        $vehicles += [ordered]@{
            fleet    = $fleet
            plate    = $plate
            target   = Num $ws.Cells.Item($r, $col0 + 2).Text
            saccoDue = Num $ws.Cells.Item($r, $col0 + 3).Text
            offload  = Num $ws.Cells.Item($r, $col0 + 4).Text
            route    = $ws.Cells.Item($r, $col0 + 5).Text.Trim()
            staff    = $ws.Cells.Item($r, $col0 + 6).Text.Trim()
        }
    }
    $groups += [ordered]@{
        sheet    = $sn
        title    = $title
        staff    = $staff
        vehicles = $vehicles
    }
    "{0}: {1} vehicles  [{2} / {3}]" -f $sn, $vehicles.Count, $title, $staff
}

$doc = [ordered]@{
    updated  = (Get-Date -Format 'yyyy-MM-dd')
    source   = "NEW FLEET ALLOCATION PERFORMANCE LIST.xlsx"
    groups   = $groups
}
$json = $doc | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($out, $json, (New-Object System.Text.UTF8Encoding($false)))

$wb.Close($false); $excel.Quit()
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null
"written: $out (" + (Get-Item $out).Length + " bytes)"
