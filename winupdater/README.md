# Vantage WinUpdater

Auto-updater for Vantage Browser on Windows, based on [LibreWolf WinUpdater](https://codeberg.org/librewolf/winupdater).

## How it works

1. Downloads `vd.json` from `asystech.cn/vantage/vd.json`
2. Compares version with installed `vantage.exe`
3. If new version found: downloads installer, waits for browser to close, runs `vantage-setup.exe /S`
4. Can be scheduled (Task Scheduler: at login + every 4 hours)

## Build

Requires [AutoHotkey v1.1](https://www.autohotkey.com/):

```batch
Ahk2Exe.exe /in Vantage-WinUpdater.ahk /out Vantage-WinUpdater.exe /icon Vantage-WinUpdater.ico
```

Place the compiled `.exe` in `winupdater/` before running `make package` on Linux.

## Distribution

The following files are bundled into the Windows NSIS installer automatically during `make package`:

- `Vantage-WinUpdater.exe` (must exist before packaging)
- `Vantage-WinUpdater.ico`
- `ScheduledTask-Create.ps1`
- `ScheduledTask-Remove.ps1`

### Packaging flow

```
make package (with Windows mozconfig)
  ├→ Makefile injects files into objdir/dist/bin/winupdater/
  ├→ librewolf-patches.py adds @RESPATH@/winupdater/* to package-manifest.in
  └→ mach package includes them in the NSIS installer

NSIS post-install (installer-winupdater.patch):
  ├→ Silent install (/S): skipped (winget handles updates)
  └→ Interactive: runs ScheduledTask-Create.ps1 (hidden, no popup)
```

### Silent install (/S)

- Taskbar pin is disabled (`$AddTaskbarSC = "0"`) to avoid OS confirmation dialog
- WinUpdater scheduled task registration is skipped during silent install to avoid UAC prompt
- PowerShell windows are hidden (`-WindowStyle Hidden`, no `ReadKey`)

## vd.json Format

The updater expects:

```json
{
  "version": "153.0-1",
  "links": {
    "windows_exe": "https://dl.asystech.cn/latest/amd/vantage-153.0-1.x86_64-installer.exe"
  }
}
```

- `version`: version number (digits only, no suffix needed; `正式版` etc. are stripped)
- `links.windows_exe`: direct URL to the NSIS installer .exe
