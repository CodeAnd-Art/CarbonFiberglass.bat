# ============================================================
# HATA YÖNETİMİ - Tüm modülleri başlatır, izler ve çökenleri yeniden başlatır
# ============================================================
$moduller = @(
    "modul_isik_patlamasi.ps1",
    "modul_glitch.ps1",
    "modul_renk.ps1",
    "modul_hata.ps1",
    "modul_ses.ps1",
    "modul_fare.ps1",
    "modul_anormallik.ps1",
    "modul_sembol.ps1",
    "modul_disk.ps1",
    "modul_rom.ps1",
    "modul_antivirus_bypass.ps1",
    "modul_muzik.ps1",
    "modul_efekt_dongusu.ps1"
)

$calisan = @{}

# Tüm modülleri başlat
foreach ($modul in $moduller) {
    try {
        $job = Start-Job -ScriptBlock {
            param($m)
            & powershell -ExecutionPolicy Bypass -File $m
        } -ArgumentList $modul
        $calisan[$modul] = $job
        Write-Host "✅ $modul baslatildi." -ForegroundColor Green
    } catch {
        Write-Host "❌ $modul baslatilamadi: $_" -ForegroundColor Red
    }
}

# Modülleri izle ve çökenleri yeniden başlat
while ($true) {
    foreach ($modul in $moduller) {
        if ($calisan.ContainsKey($modul)) {
            $job = $calisan[$modul]
            if ($job.State -eq "Completed" -or $job.State -eq "Failed") {
                Write-Host "⚠️ $modul coktu, yeniden baslatiliyor..." -ForegroundColor Yellow
                Remove-Job -Job $job -Force
                try {
                    $yeniJob = Start-Job -ScriptBlock {
                        param($m)
                        & powershell -ExecutionPolicy Bypass -File $m
                    } -ArgumentList $modul
                    $calisan[$modul] = $yeniJob
                    Write-Host "✅ $modul yeniden baslatildi." -ForegroundColor Green
                } catch {
                    Write-Host "❌ $modul yeniden baslatilamadi: $_" -ForegroundColor Red
                }
            }
        }
    }
    Start-Sleep -Seconds 5
}