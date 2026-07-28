Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$label = New-Object System.Windows.Forms.Label
$label.Dock = 'Fill'
$label.Font = New-Object System.Drawing.Font('Arial', 40, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = 'Red'
$label.TextAlign = 'MiddleCenter'
$label.Text = ''
$form.Controls.Add($label)

$semboller = @('❌', '⚠️', '💀', '☢️', '🔥', '⚡', '🌀', '💥', '👾', '🎭', '🔮', '🕳️')

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 80
$timer.Add_Tick({
    try {
        $label.Text = $semboller | Get-Random
        $label.ForeColor = [System.Drawing.Color]::FromArgb(
            (Get-Random -Min 0 -Max 256),
            (Get-Random -Min 0 -Max 256),
            (Get-Random -Min 0 -Max 256)
        )
        $label.Font = New-Object System.Drawing.Font('Arial', (Get-Random -Min 30 -Max 120), [System.Drawing.FontStyle]::Bold)
    } catch {}
})
$timer.Start()
$form.ShowDialog()