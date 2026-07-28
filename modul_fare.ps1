Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 50
$timer.Add_Tick({
    try {
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        for ($i=0; $i -lt 12; $i++) {
            $x = Get-Random -Min 0 -Max $screen.Width
            $y = Get-Random -Min 0 -Max $screen.Height
            [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
            Start-Sleep -Milliseconds 10
        }
    } catch {}
})
$timer.Start()

while ($true) { Start-Sleep -Seconds 1 }