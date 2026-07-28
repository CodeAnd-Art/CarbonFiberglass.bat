# 30 saniyelik müziği SÜREKLİ TEKRARLA
$player = New-Object -ComObject WMPlayer.OCX
$player.settings.volume = 100
$player.settings.autoStart = $true
$player.URL = ".\music_3.mp3"

while ($true) {
    $player.controls.play()
    # Müzik bitene kadar bekle (30 sn veya dosya uzunluğu kadar)
    Start-Sleep -Seconds 30
    # Müzik bittiğinde yeniden başlat (tekrar)
    $player.controls.stop()
    Start-Sleep -Milliseconds 100
}