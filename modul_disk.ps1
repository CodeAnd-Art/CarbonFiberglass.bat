while ($true) {
    try {
        $tempFile = "C:\temp_fill.bin"
        $stream = [System.IO.File]::OpenWrite($tempFile)
        $stream.SetLength(1GB)
        $stream.Close()
        Write-Host "Disk: %100 dolu (Simülasyon)" -ForegroundColor Red
        Start-Sleep -Seconds 5
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
    } catch {}
    Start-Sleep -Seconds 2
}