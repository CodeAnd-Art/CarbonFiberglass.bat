Add-Type -AssemblyName System.Windows.Forms

$hataKodlari = @(
    "0x0000001A", "0x00000023", "0x0000007B", "0x0000007E",
    "0x0000008E", "0x000000BE", "0x000000C2", "0x000000D1",
    "0x000000EA", "0x000000F4"
)
$hataMesajlari = @(
    "KERNEL PANIC", "SYSTEM CRASH", "FATAL ERROR",
    "MEMORY DUMP", "IRQ NOT LESS OR EQUAL",
    "PAGE FAULT", "BAD SYSTEM CONFIG",
    "CRITICAL PROCESS DIED", "HARDWARE MALFUNCTION",
    "UNEXPECTED KERNEL MODE TRAP"
)

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100
$timer.Add_Tick({
    try {
        $count = Get-Random -Min 1 -Max 5
        for ($i=0; $i -lt $count; $i++) {
            $kod = $hataKodlari | Get-Random
            $mesaj = $hataMesajlari | Get-Random
            [System.Windows.Forms.MessageBox]::Show(
                "$mesaj`n`nError Code: $kod",
                "SYSTEM ERROR",
                "OK",
                "Error"
            )
        }
    } catch {}
})
$timer.Start()

while ($true) { Start-Sleep -Seconds 1 }