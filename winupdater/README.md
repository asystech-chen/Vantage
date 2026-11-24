# Vantage WinUpdater

Auto-updater for Vantage Browser on Windows. Originally based on
[LibreWolf WinUpdater](https://codeberg.org/librewolf/winupdater), rewritten
in C# (net472 + WinForms) to avoid the antivirus false positives that the
AutoHotkey-compiled executable used to trigger.

## How it works

1. Downloads `vd.json` from `asystech.cn/vantage/vd.json`
2. Compares the advertised version with the installed `vantage.exe`
   - The version comes from the `ProductVersion` resource of `vantage.exe`
     (`153.7.0-1`); a leftover `vantage.exe.wubak` is restored only when the
     browser executable is missing, so an interrupted cleanup can never
     downgrade a working install
   - The browser is located by: the path handed over when the updater
     relaunches itself from `%APPDATA%`, `..\vantage.exe` next to the
     updater, then all `Uninstall` registry entries that still contain a real
     installation (`application.ini` present) — the newest version wins, so
     stale 153.1.0-1 leftovers are ignored
3. If a newer version is found: downloads the installer, verifies its SHA-256,
   waits for the browser to close, then runs `vantage-setup.exe /S`
   - Large files are fetched with HTTP Range segments over 8 parallel
     connections (the CDN throttles single connections); a failed segment or
     a server without Range support falls back to a single connection
4. Can be scheduled (Task Scheduler: at logon + every 4 hours)

There is no window. The updater lives in the notification area:

- Hover the tray icon to see the current status / progress
- Right-click → **Check for updates** or **Exit**
- Balloon notifications are error-only: checking, downloading and installing
  never show a balloon

The updater is one-shot: it checks once and exits. With no update it exits
silently. The normal flow (new version found, downloading, installing) shows
no balloons — only the tray tooltip changes — and a successful update also
finishes silently. Only errors show a balloon, wait a few seconds, and exit.
Scheduled runs stay completely invisible (no tray icon, no dialogs); errors
are still reported.

If the per-user scheduled task is missing, any non-portable run registers it
again (the installer already does this through `/CreateTask`). When the
installer runs elevated, the task is registered with `HighestAvailable` (like
the old PowerShell version) so scheduled updates install without an extra UAC
prompt; otherwise it uses `LeastPrivilege`.

## Download layer

Downloads use the .NET HTTP stack (`HttpWebRequest`, TLS 1.2 via Schannel),
connect directly (like the old curl calls, ignoring any stale WinINet proxy),
disable certificate-revocation checks and stream to disk. Neither `curl.exe`
nor `cmd.exe` is involved.

Data is written to a stable `<version>.exe.partial` file and moved to a
unique per-run name (`Vantage-<version>-<id>.exe`) when complete, so a stale
locked file from an earlier stalled run cannot block the update. Failures and
progress are logged to `%TEMP%\Vantage-WinUpdater.log`.

## Download tuning

The updater probes `Content-Length` / `Accept-Ranges` and splits files of
8 MB or more into parallel Range segments. Each segment has a low-speed
watchdog and up to three retries; any failure falls back to a plain
single-connection download.

Downloads are written to `<file>.partial` and moved into place only when
complete, so a stale/locked destination cannot block a retry. If no bytes
arrive for 90 seconds the segmented attempt is aborted and the updater falls
back to a resuming single connection.

Connections can be tuned in `Vantage-WinUpdater.ini` (next to the exe):

```ini
[Settings]
Threads=8
```

`Threads=1` disables segmented downloading; the allowed range is 1–8.

## Modes

| Argument | Behaviour |
|---|---|
| *(none)* | Interactive: tray icon, immediate check, then exit (silent when no update or after success, balloon on errors only) |
| `/Scheduled` | Silent run for Task Scheduler; exits when finished |
| `/CreateTask` | Registers the per-user scheduled task and exits |
| `/RemoveTask` | Removes the per-user scheduled task and exits |
| `/Uninstall` | Removes task, `%APPDATA%` copy, registry entry and component folder (self-elevates through UAC) |
| `/Portable` | Treats the current folder as a portable installation |

## Build

Requires the .NET SDK (works from Linux — the project cross-compiles to a
Windows IL executable):

```bash
./build.sh
```

Output: `Vantage-WinUpdater.exe` (~310 KB, PE32, .NET Framework 4.7.2).
No runtime is bundled: Windows 10 1809+ and Windows 11 ship .NET Framework
4.7.2/4.8. Place the compiled `.exe` in `winupdater/` before running
`make package` on Linux.

## Distribution

The following files are bundled into the Windows NSIS installer during
`make package`:

- `Vantage-WinUpdater.exe`
- `Vantage-WinUpdater.ico` (used by the Apps & features entry)

No PowerShell scripts are used anymore.

### Packaging flow

```
make package (with Windows mozconfig)
  ├→ Makefile injects files into objdir/dist/bin/winupdater/
  ├→ librewolf-patches.py adds @RESPATH@/winupdater/* to package-manifest.in
  └→ mach package includes them in the NSIS installer

NSIS installer behaviour (installer-winupdater.patch):
  ├→ Interactive install: dedicated "Automatic Updates" page asks the user
  │    ├→ Checkbox ticked (default): runs `Vantage-WinUpdater.exe /CreateTask`
  │    │    and adds an Apps & features entry ("Vantage WinUpdater")
  │    └→ Checkbox unticked: runs `Vantage-WinUpdater.exe /Uninstall /Quiet`
  ├→ Silent install (/S), fresh: WinUpdater is never installed
  └→ Silent install (/S), upgrade: an existing WinUpdater is kept
       (otherwise the auto-updater would uninstall itself mid-update)
```

### Uninstalling

The Apps & features entry points at
`"$INSTDIR\winupdater\Vantage-WinUpdater.exe" /Uninstall`. The updater:

1. Re-launches itself elevated through UAC when needed
2. Removes every scheduled task named `Vantage WinUpdater*`
3. Removes the runtime copy under `%APPDATA%\Vantage\WinUpdater`
4. Removes the HKCU/HKLM Apps & features registry keys (32- and 64-bit views)
5. Removes the component folder through a detached `cmd.exe` (the running
   executable cannot delete itself)

The main Vantage uninstaller and the opt-out path of the installer run the
same `/Uninstall /Quiet` mode. Failures are written to
`%TEMP%\Vantage-WinUpdater-uninstall.log`.

## vd.json format

The updater expects:

```json
{
  "version": "153.7.0-1",
  "links": {
    "windows_exe": "https://dl.asystech.cn/latest/amd/vantage-153.7.0-1.x86_64-installer.exe",
    "windows_exe_sha256": "178E63...",
    "win_arm64_exe": "https://dl.asystech.cn/latest/aarch/vantage-153.7.0-1.aarch64-installer.exe",
    "win_arm64_exe_sha256": "1CC244..."
  }
}
```

- `version`: version number (digits only; `正式版` and similar suffixes are ignored)
- The updater reads `windows_exe` / `windows_exe_sha256` on x86_64/i686 and
  `win_arm64_exe` / `win_arm64_exe_sha256` on ARM64
- A missing sha256 is treated as an error (integrity check is mandatory)

## Legacy

The previous AutoHotkey implementation and the PowerShell helper scripts are
kept under `legacy/` for reference only; they are not packaged or used.
