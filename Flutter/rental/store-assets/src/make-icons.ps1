# Generates the Rental Management app icon set:
#   assets/icon/app_icon.png            1024x1024 full icon (legacy launcher + web/marketing)
#   assets/icon/app_icon_background.png 1024x1024 adaptive background layer
#   assets/icon/app_icon_foreground.png 1024x1024 adaptive foreground layer (transparent, safe-zone scaled)
#   store-assets/play-icon-512.png      512x512 Play Store icon
#
# Brand: diagonal #1E3A8A -> #2563EB -> #3B82F6 gradient, white house with arched
# doorway and keyhole. Run: powershell -File make-icons.ps1
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Drawing.Drawing2D

$src  = $PSScriptRoot
$root = Split-Path -Parent (Split-Path -Parent $src)   # repo root
$iconDir = Join-Path $root 'assets\icon'
New-Item -ItemType Directory -Force -Path $iconDir | Out-Null
$storeDir = Join-Path $root 'store-assets'
New-Item -ItemType Directory -Force -Path $storeDir | Out-Null

$c1 = [System.Drawing.Color]::FromArgb(255, 30, 58, 138)    # #1E3A8A
$c2 = [System.Drawing.Color]::FromArgb(255, 37, 99, 235)    # #2563EB
$c3 = [System.Drawing.Color]::FromArgb(255, 59, 130, 246)   # #3B82F6

function New-BrandGradient([System.Drawing.RectangleF]$rect) {
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $script:c1, $script:c3, 45.0)
    $blend = New-Object System.Drawing.Drawing2D.ColorBlend 3
    $blend.Colors = @($script:c1, $script:c2, $script:c3)
    $blend.Positions = @([single]0.0, [single]0.55, [single]1.0)
    $brush.InterpolationColors = $blend
    return $brush
}

function Add-Glow($g, [single]$cx, [single]$cy, [single]$r, [System.Drawing.Color]$center) {
    $p = New-Object System.Drawing.Drawing2D.GraphicsPath
    $p.AddEllipse($cx - $r, $cy - $r, 2 * $r, 2 * $r)
    $pgb = New-Object System.Drawing.Drawing2D.PathGradientBrush($p)
    $pgb.CenterColor = $center
    $edge = [System.Drawing.Color]::FromArgb(0, $center.R, $center.G, $center.B)
    $pgb.SurroundColors = @($edge)
    $g.FillPath($pgb, $p)
    $pgb.Dispose(); $p.Dispose()
}

function New-ScaledMatrix([double]$scale) {
    # GDI+ MatrixOrder.Prepend (default): each call applies BEFORE the previous one,
    # so read the transform right-to-left. Translate(-512,-512) runs first.
    $m = New-Object System.Drawing.Drawing2D.Matrix
    $m.Translate(512, 512)
    $m.Scale($scale, $scale)
    $m.Translate(-512, -512)
    return $m
}

function Add-RoundedBottomRect($path, [single]$x, [single]$y, [single]$w, [single]$h, [single]$r) {
    $path.AddLine($x, $y, $x + $w, $y)
    $path.AddLine($x + $w, $y, $x + $w, $y + $h - $r)
    $path.AddArc($x + $w - 2 * $r, $y + $h - 2 * $r, 2 * $r, 2 * $r, 0, 90)
    $path.AddArc($x + $r, $y + $h - 2 * $r, 2 * $r, 2 * $r, 90, 90)
    $path.CloseFigure()
}

function Get-HouseParts([double]$scale) {
    $matrix = New-ScaledMatrix $scale

    # Silhouette as ONE closed figure: roof with eaves + body with rounded feet.
    # Cubic k = 0.5523 * radius for the corner curves (r = 44).
    $house = New-Object System.Drawing.Drawing2D.GraphicsPath
    $house.AddLine(512, 210, 848, 494)                    # roof left slope
    $house.AddLine(848, 494, 788, 494)                    # right eave underside
    $house.AddLine(788, 494, 788, 808)                    # body right side
    $house.AddBezier(788, 808, 788, 832.3, 767.7, 852, 744, 852)   # bottom-right foot
    $house.AddLine(744, 852, 280, 852)                    # body bottom
    $house.AddBezier(280, 852, 256.3, 852, 236, 832.3, 236, 808)   # bottom-left foot
    $house.AddLine(236, 808, 236, 494)                    # body left side
    $house.AddLine(236, 494, 176, 494)                    # left eave underside
    $house.CloseFigure()                                  # left roof slope back to apex

    # Arched doorway, punched out of the silhouette (semicircle r = 66 as 2 beziers).
    $door = New-Object System.Drawing.Drawing2D.GraphicsPath
    $door.AddLine(446, 852, 446, 712)
    $door.AddBezier(446, 712, 446, 675.55, 475.55, 646, 512, 646)
    $door.AddBezier(512, 646, 548.45, 646, 578, 675.55, 578, 712)
    $door.AddLine(578, 712, 578, 852)
    $door.CloseFigure()

    # Keyhole inside the doorway.
    $keyhole = New-Object System.Drawing.Drawing2D.GraphicsPath
    $keyhole.AddEllipse(512 - 25, 734 - 25, 50, 50)
    $keyhole.AddPolygon(@(
        (New-Object System.Drawing.PointF(496, 762)),
        (New-Object System.Drawing.PointF(528, 762)),
        (New-Object System.Drawing.PointF(520, 806)),
        (New-Object System.Drawing.PointF(504, 806))))

    $house.Transform($matrix)
    $door.Transform($matrix)
    $keyhole.Transform($matrix)
    $matrix.Dispose()

    $region = New-Object System.Drawing.Region($house)
    $region.Exclude($door)

    return @{ Region = $region; Keyhole = $keyhole; House = $house; Door = $door }
}

function New-Canvas([switch]$Transparent) {
    $bmp = New-Object System.Drawing.Bitmap(1024, 1024, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    if ($Transparent) { $g.Clear([System.Drawing.Color]::Transparent) } else { $g.Clear($script:c1) }
    return @{ Bitmap = $bmp; Graphics = $g }
}

function Draw-Background($g) {
    $rect = New-Object System.Drawing.RectangleF(0, 0, 1024, 1024)
    $grad = New-BrandGradient $rect
    $g.FillRectangle($grad, $rect)
    $grad.Dispose()
    Add-Glow $g 880 130 340 ([System.Drawing.Color]::FromArgb(34, 255, 255, 255))
    Add-Glow $g 120 950 300 ([System.Drawing.Color]::FromArgb(46, 11, 17, 32))
}

function Draw-House($g, [double]$scale, [System.Drawing.Color]$fillColor) {
    $parts = Get-HouseParts $scale
    $brush = New-Object System.Drawing.SolidBrush($fillColor)
    $g.FillRegion($brush, $parts.Region)
    $g.FillPath($brush, $parts.Keyhole)
    $brush.Dispose()
    $parts.Region.Dispose()
    $parts.Keyhole.Dispose()
    $parts.House.Dispose()
    $parts.Door.Dispose()
}

$white = [System.Drawing.Color]::White

# --- Adaptive layers -------------------------------------------------------
$fg = New-Canvas -Transparent
Draw-House $fg.Graphics 0.78 $white   # keep artwork inside the 66% safe zone
$fgPath = Join-Path $iconDir 'app_icon_foreground.png'
$fg.Bitmap.Save($fgPath, [System.Drawing.Imaging.ImageFormat]::Png)
$fg.Graphics.Dispose(); $fg.Bitmap.Dispose()

$bg = New-Canvas
Draw-Background $bg.Graphics
$bgPath = Join-Path $iconDir 'app_icon_background.png'
$bg.Bitmap.Save($bgPath, [System.Drawing.Imaging.ImageFormat]::Png)
$bg.Graphics.Dispose(); $bg.Bitmap.Dispose()

# --- Full icon (legacy launcher + marketing master) ------------------------
$icon = New-Canvas
Draw-Background $icon.Graphics
Draw-House $icon.Graphics 1.0 $white
$iconPath = Join-Path $iconDir 'app_icon.png'
$icon.Bitmap.Save($iconPath, [System.Drawing.Imaging.ImageFormat]::Png)

# --- Play Store 512x512 ----------------------------------------------------
$play = New-Object System.Drawing.Bitmap(512, 512, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$pg = [System.Drawing.Graphics]::FromImage($play)
$pg.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$pg.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$pg.DrawImage($icon.Bitmap, (New-Object System.Drawing.Rectangle(0, 0, 512, 512)))
$pg.Dispose()
$playPath = Join-Path $storeDir 'play-icon-512.png'
$play.Save($playPath, [System.Drawing.Imaging.ImageFormat]::Png)
$play.Dispose()
$icon.Graphics.Dispose(); $icon.Bitmap.Dispose()

Write-Output "icon:       $iconPath"
Write-Output "foreground: $fgPath"
Write-Output "background: $bgPath"
Write-Output "play 512:   $playPath"
