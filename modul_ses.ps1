Add-Type -AssemblyName System.Media

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 300
$timer.Add_Tick({
    try {
        # Frekans 50-100 Hz arası SABİT (aşağı inmez)
        $freq = Get-Random -Min 50 -Max 100
        $dur = Get-Random -Min 50 -Max 200
        [System.Console]::Beep($freq, $dur)
        if ((Get-Random -Min 1 -Max 3) -eq 1) {
            $sesler = @(
                [System.Media.SystemSounds]::Asterisk,
                [System.Media.SystemSounds]::Exclamation,
                [System.Media.SystemSounds]::Hand,
                [System.Media.SystemSounds]::Question
            )
            $sesler | Get-Random | ForEach-Object { $_.Play() }
        }
    } catch {}
})
$timer.Start()

while ($true) { Start-Sleep -Seconds 1 }