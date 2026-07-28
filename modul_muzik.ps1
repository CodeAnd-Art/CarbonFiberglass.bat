# music_3.mp3 dosyasını aynı klasörden çalar
$player = New-Object -ComObject WMPlayer.OCX
$player.settings.volume = 100
$player.URL = ".\music_3.mp3"
$player.controls.play()

while ($true) { Start-Sleep -Seconds 10 }