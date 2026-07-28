# ============================================================
# RAM / ROM %100 DOLDUR (Bellek Tüketimi)
# ============================================================
$ramList = @()
while ($true) {
    try {
        # Her döngüde 100 MB ekle
        $ramList += [string]::new('A', 100 * 1024 * 1024)
        Write-Host "RAM: %100 dolu (Simülasyon)" -ForegroundColor Red
        Start-Sleep -Seconds 3
    } catch {
        Write-Host "RAM doldurma hatasi: $_" -ForegroundColor Yellow
        # Bellek dolduğunda hata alınabilir, bekle ve devam et
        Start-Sleep -Seconds 5
    }
}