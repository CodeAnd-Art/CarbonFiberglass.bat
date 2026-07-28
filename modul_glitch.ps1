Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 30
$timer.Add_Tick({
    try {
        $g = $form.CreateGraphics()
        for ($i=0; $i -lt 600; $i++) {
            $x = Get-Random -Min 0 -Max $form.Width
            $y = Get-Random -Min 0 -Max $form.Height
            $w = Get-Random -Min 1 -Max $form.Width
            $h = Get-Random -Min 1 -Max 40
            $r = Get-Random -Min 0 -Max 256
            $g2 = Get-Random -Min 0 -Max 256
            $b = Get-Random -Min 0 -Max 256
            $renk = [System.Drawing.Color]::FromArgb($r, $g2, $b)
            $brush = New-Object System.Drawing.SolidBrush($renk)
            $g.FillRectangle($brush, $x, $y, $w, $h)
        }
        for ($i=0; $i -lt 30; $i++) {
            $y = Get-Random -Min 0 -Max $form.Height
            $renk = [System.Drawing.Color]::FromArgb(255, 255, 255)
            $brush = New-Object System.Drawing.SolidBrush($renk)
            $g.FillRectangle($brush, 0, $y, $form.Width, 1)
        }
        $g.Dispose()
    } catch {}
})
$timer.Start()
$form.ShowDialog()