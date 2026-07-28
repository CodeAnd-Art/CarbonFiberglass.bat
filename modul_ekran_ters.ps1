Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$label = New-Object System.Windows.Forms.Label
$label.Dock = 'Fill'
$label.Font = New-Object System.Drawing.Font('Consolas', 100, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = 'Red'
$label.TextAlign = 'MiddleCenter'
$label.Text = '⚠️ EKRAN DÖNDÜ ⚠️'
$form.Controls.Add($label)

try { $form.RotateFlip = 1 } catch {}

$form.ShowDialog()