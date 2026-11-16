@echo off
net session >nul 2>&1 || (powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs" & exit /b)

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad\Status" /v Enabled /t REG_DWORD /d 0 /f >nul
powershell -NoProfile -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -eq 'HID-compliant touch pad' } | Disable-PnpDevice -Confirm:$false" >nul 2>&1
