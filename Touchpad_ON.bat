@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad\Status" /v Enabled /t REG_DWORD /d 1 /f >nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1, True