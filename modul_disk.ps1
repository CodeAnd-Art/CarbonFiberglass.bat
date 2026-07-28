# ============================================================
# DISK %100 DOLDUR (Geçici Dosya ile)
# ============================================================
while ($true) {
    try {
        $tempFile = "C:\temp_fill.bin"
        $stream = [System.IO.File]::OpenWrite($tempFile)
        $stream.SetLength(1GB)  # 1 GB
        $stream.Close()
        Write-Host "Disk: %100 dolu (Simülasyon)" -ForegroundColor Red
        Start-Sleep -Seconds 5
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "Disk doldurma hatasi: $_" -ForegroundColor Yellow
    }
    Start-Sleep -Seconds 2
}