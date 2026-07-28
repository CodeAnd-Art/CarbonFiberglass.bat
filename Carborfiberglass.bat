@echo off
title CarbonFiberglass - Ultimate
color 0c
cls

echo ============================================================
echo   ☢️  CARBONFIBERGLASS ACTIVATED  ☢️
echo ============================================================
echo   Gorsel solen simülasyonu.
echo   Dosyalara dokunmaz, sadece efekt.
echo   Press any key to start chaos...
pause >nul

:: ============================================================
:: TUM MODULLERI ARKA PLANDA BASLAT
:: ============================================================
for %%f in (modul_*.ps1) do (
    start /b powershell -ExecutionPolicy Bypass -File %%f
)

:: ============================================================
:: SURE (8-10 DAKIKA)
:: ============================================================
set /a SURE=%random% %% 120 + 480
echo ============================================================
echo   ☢️ CHAOS ACTIVATED ☢️
echo   Duration: %SURE% seconds
echo   VM will be killed after this.
echo ============================================================
timeout /t %SURE% /nobreak >nul

:: ============================================================
:: BSOD TETIKLE
:: ============================================================
start /b powershell -ExecutionPolicy Bypass -File modul_bsod.ps1

:: ============================================================
:: BITIS EKRANI
:: ============================================================
cls
echo ============================================================
echo   ☢️ VM KILLED ☢️
echo   SYSTEM PANIC
echo   BOOT FAILURE
echo   SIMULATION COMPLETE
echo ============================================================
pause >nul