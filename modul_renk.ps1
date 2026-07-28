Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$label = New-Object System.Windows.Forms.Label
$label.Dock = 'Fill'
$label.Font = New-Object System.Drawing.Font('Arial Black', 80, [System.Drawing.FontStyle]::Bold)
$label.TextAlign = 'MiddleCenter'
$label.ForeColor = 'White'
$label.Text = '🌀'
$form.Controls.Add($label)

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 80
$timer.Add_Tick({
    try {
        $r = Get-Random -Min 0 -Max 256
        $g = Get-Random -Min 0 -Max 256
        $b = Get-Random -Min 0 -Max 256
        $form.BackColor = [System.Drawing.Color]::FromArgb($r, $g, $b)
        $label.ForeColor = [System.Drawing.Color]::FromArgb((255-$r), (255-$g), (255-$b))
        $semboller = @('🌀', '⚡', '💀', '🔥', '💥', '☢️', '👾', '🎭', '🔮')
        $label.Text = $semboller | Get-Random
        $label.Font = New-Object System.Drawing.Font('Arial Black', (Get-Random -Min 60 -Max 180), [System.Drawing.FontStyle]::Bold)
    } catch {}
})
$timer.Start()
$form.ShowDialog()