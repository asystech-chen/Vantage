Write-Output "Uninstalling Vantage WinUpdater..."
$Title = "Vantage WinUpdater"
$Host.UI.RawUI.WindowTitle = $Title

# 1. Remove the scheduled task (per-user, task name carries the user name)
$UserName = If ($Args[0]) {$Args[0]} Else {[Environment]::UserName}
Unregister-ScheduledTask -TaskName "$Title ($UserName)" -Confirm:$false -ErrorAction SilentlyContinue

# 2. Remove the runtime copy under %APPDATA%\Vantage\WinUpdater
$AppDataDir = Join-Path ([Environment]::GetFolderPath('ApplicationData')) "Vantage\WinUpdater"
If (Test-Path $AppDataDir) {
  Remove-Item -Recurse -Force $AppDataDir -ErrorAction SilentlyContinue
}

# 3. Remove the Add/Remove Programs entry (HKLM fallback included)
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage WinUpdater" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage WinUpdater" -Recurse -Force -ErrorAction SilentlyContinue

# 4. Remove the component directory this script lives in. The script has
#    already been fully read into memory, so removing its own folder is safe.
If (Test-Path $PSScriptRoot) {
  Remove-Item -Recurse -Force $PSScriptRoot -ErrorAction SilentlyContinue
}

Write-Output "Done."
