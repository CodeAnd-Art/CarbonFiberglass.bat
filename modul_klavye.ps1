Add-Type -AssemblyName System.Windows.Forms

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100
$timer.Add_Tick({
    try {
        [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    } catch {}
})
$timer.Start()

while ($true) { Start-Sleep -Seconds 1 }