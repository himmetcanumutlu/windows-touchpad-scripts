@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM HID-compliant touch pad InstanceId'yi al
for /f "delims=" %%I in ('powershell -NoProfile -Command ^
  "Get-PnpDevice | Where-Object { $_.FriendlyName -eq 'HID-compliant touch pad' } | Select-Object -First 1 -ExpandProperty InstanceId"') do (
  set "TPID=%%I"
)

if not defined TPID (
  echo [HATA] Touchpad bulunamadi.
  pause
  exit /b 1
)

REM Disable -> 1 saniye bekle -> Enable
pnputil /disable-device "%TPID%" >nul 2>&1
timeout /t 1 /nobreak >nul
pnputil /enable-device "%TPID%" >nul 2>&1

echo Touchpad resetlendi.
exit /b 0
