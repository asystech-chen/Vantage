# Legacy WinUpdater (AutoHotkey)

Kept for reference only — these files are **not** packaged into the installer
and are not used at runtime.

| File | Purpose (historical) |
|---|---|
| `Vantage-WinUpdater.ahk` | AutoHotkey v1.1 implementation (compiled with Ahk2Exe) |
| `ScheduledTask-Create.ps1` | Registered the per-user update task |
| `ScheduledTask-Remove.ps1` | Removed the per-user update task |
| `Uninstall.ps1` | Apps & features / main-uninstaller cleanup, UAC self-elevation |

The C# rewrite in `../src/` replaces all of the above:

- core updater logic → `Program.cs`, `UpdateRunner.cs`, `Browser.cs`,
  `ReleaseInfo.cs`, `Downloader.cs`, `Installer.cs`
- tray UI → `TrayApp.cs`
- scheduled task → `ScheduledTask.cs` (Task Scheduler COM, no PowerShell)
- uninstall → `Uninstaller.cs`

Reason for the rewrite: the Ahk2Exe-compiled executable was frequently
flagged by antivirus products as a false positive.
