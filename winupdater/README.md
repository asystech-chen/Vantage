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

## Distribution

Bundle with Vantage Windows installer:
- `Vantage-WinUpdater.exe`
- `ScheduledTask-Create.ps1`
- `ScheduledTask-Remove.ps1`
- `Vantage-WinUpdater.ico`

The NSIS installer can offer "Enable automatic updates" option that copies these files to the install directory.

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
