Add-Type -AssemblyName System.Windows.Forms

$anormallikler = @(
    "Ekran döndü!",
    "Renkler ters çevrildi!",
    "Fare kayboldu!",
    "Ses patlaması!",
    "Piksel yağmuru!",
    "Klavye kilitlendi!",
    "Görev yöneticisi devre dışı!",
    "Disk %100 dolu! (Simülasyon)",
    "Sistem çöküyor!"
)

while ($true) {
    try {
        $anom = $anormallikler | Get-Random
        [System.Windows.Forms.MessageBox]::Show(
            "ANORMALLIK: $anom",
            "SİSTEM UYARISI",
            "OK",
            "Warning"
        )
        Start-Sleep -Seconds 10
    } catch {}
}