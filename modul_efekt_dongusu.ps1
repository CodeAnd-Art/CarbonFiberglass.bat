$efektler = @(
    "ISIK_PATLAMASI",
    "GLITCH",
    "RENK_PATLAMASI",
    "HATA_YAGMURU",
    "SES_KAOSU",
    "FARE_DELISI",
    "ANORMALLIK",
    "SEMBOL_YAGMURU",
    "DISK_DOLDU"
)

while ($true) {
    try {
        $secili = $efektler | Get-Random
        [System.Windows.Forms.MessageBox]::Show(
            "EFEKT: $secili",
            "DAKIKA EFECTI",
            "OK",
            "Information"
        )
        Start-Sleep -Seconds 60
    } catch {}
}