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
- `Uninstall.ps1`

### Packaging flow

```
make package (with Windows mozconfig)
  ├→ Makefile injects files into objdir/dist/bin/winupdater/
  ├→ librewolf-patches.py adds @RESPATH@/winupdater/* to package-manifest.in
  └→ mach package includes them in the NSIS installer

NSIS installer behavior (installer-winupdater.patch):
  ├→ Interactive install: dedicated "Automatic Updates" page asks the user
  │    ├→ Checkbox ticked (default): registers the scheduled task and adds
  │    │    an Add/Remove Programs entry ("Vantage WinUpdater" in the
  │    │    Windows app list, uninstallable from Settings → Apps)
  │    └→ Checkbox unticked: runs Uninstall.ps1, removes the files, the
  │         task, the %APPDATA% copy, and the registry entry
  ├→ Silent install (/S), fresh: WinUpdater is never installed
  └→ Silent install (/S), upgrade: an existing WinUpdater is kept
       (otherwise the auto-updater would uninstall itself mid-update)
```

### Silent install (/S)

- Taskbar pin is disabled (`$AddTaskbarSC = "0"`) to avoid OS confirmation dialog
- WinUpdater is never installed on a fresh silent install
- PowerShell windows are hidden (`-WindowStyle Hidden`, no `ReadKey`)

### Uninstalling WinUpdater from the Windows app list

The Add/Remove Programs entry points at `Uninstall.ps1`, which:

1. Removes the scheduled task (`Vantage WinUpdater (<user>)`)
2. Removes the runtime copy under `%APPDATA%\Vantage\WinUpdater`
3. Removes the Add/Remove Programs registry key
4. Removes the component folder it lives in

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
