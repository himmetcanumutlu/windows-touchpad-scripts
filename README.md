# 🖱️ win-touchpad-control

[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Script](https://img.shields.io/badge/Language-Batch%20%28.bat%29-4EAA25?logo=gnubash&logoColor=white)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Lightweight, zero-dependency `.bat` utilities to instantly **enable**, **disable**, or **hardware-reset** Windows Precision Touchpads. Built for speed and simplicity—originally tested on a **Lenovo ThinkPad X1 Carbon (Gen 7)**.

---

## 📦 Included Scripts

| Script | Action | Method | Admin Required? |
| :--- | :--- | :--- | :---: |
| **`Touchpad_ON.bat`** | Enables the touchpad | Windows Registry (`PrecisionTouchPad`) | ❌ No |
| **`Touchpad_OFF.bat`** | Disables the touchpad | Windows Registry (`PrecisionTouchPad`) | ❌ No |
| **`touchpad_fix.bat`** | Hard-resets a frozen/unresponsive touchpad | PowerShell + `pnputil` (Disable/Enable cycle) | ✅ **Yes** |

---

## 🚀 Usage

1. **Download** the repository (`Code` → `Download ZIP`) or clone it:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/win-touchpad-control.git](https://github.com/YOUR_USERNAME/win-touchpad-control.git)
   ```
2. **Double-click** `Touchpad_ON.bat` or `Touchpad_OFF.bat` to toggle your touchpad immediately without opening Windows Settings.
3. If your touchpad freezes, stops responding, or loses gestures after sleep/wake, **right-click** `touchpad_fix.bat` and select **Run as administrator**.

> **Tip:** You can create desktop shortcuts for these `.bat` files and assign custom keyboard hotkeys (e.g., `Ctrl + Alt + T`) under *Shortcut Properties → Shortcut key* for instant one-key toggling.

---

## ⚙️ How It Works

* **Toggle Scripts (`Touchpad_ON.bat` / `Touchpad_OFF.bat`):**
  Modifies `HKCU\Software\Microsoft\Windows\CurrentVersion\PrecisionTouchPad\Status` (`Enabled` DWORD `1` or `0`) and triggers `UpdatePerUserSystemParameters` via `user32.dll` so Windows applies the state without a reboot.
* **Reset Script (`touchpad_fix.bat`):**
  Queries PnP devices via PowerShell to locate the `HID-compliant touch pad` hardware `InstanceId`, then forces a clean driver restart using `pnputil /disable-device` followed by `pnputil /enable-device`.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
