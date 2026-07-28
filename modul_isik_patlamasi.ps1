Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 50
$timer.Add_Tick({
    try {
        $tip = Get-Random -Min 1 -Max 10
        if ($tip -le 3) {
            $form.BackColor = 'White'
            Start-Sleep -Milliseconds 30
            $form.BackColor = 'Black'
        } elseif ($tip -le 6) {
            $r = Get-Random -Min 200 -Max 256
            $g = Get-Random -Min 200 -Max 256
            $b = Get-Random -Min 200 -Max 256
            $form.BackColor = [System.Drawing.Color]::FromArgb($r, $g, $b)
            Start-Sleep -Milliseconds 50
            $form.BackColor = 'Black'
        } else {
            $g = $form.CreateGraphics()
            for ($i=0; $i -lt 100; $i++) {
                $x = Get-Random -Min 0 -Max $form.Width
                $y = Get-Random -Min 0 -Max $form.Height
                $w = Get-Random -Min 10 -Max 200
                $h = Get-Random -Min 10 -Max 200
                $r = Get-Random -Min 0 -Max 256
                $g2 = Get-Random -Min 0 -Max 256
                $b2 = Get-Random -Min 0 -Max 256
                $renk = [System.Drawing.Color]::FromArgb($r, $g2, $b2)
                $brush = New-Object System.Drawing.SolidBrush($renk)
                $g.FillRectangle($brush, $x, $y, $w, $h)
            }
            $g.Dispose()
            Start-Sleep -Milliseconds 80
            $form.BackColor = 'Black'
        }
    } catch {}
})
$timer.Start()
$form.ShowDialog()