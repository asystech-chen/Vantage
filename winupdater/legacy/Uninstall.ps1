# Vantage WinUpdater uninstaller.
#
# Works both from Windows Settings > Apps and from the main Vantage
# uninstaller. Vantage is normally installed under Program Files, so
# removing the component needs an elevated process; if we are not elevated
# we re-launch ourselves through UAC. Everything runs hidden, so a log is
# kept in %TEMP% for troubleshooting.

param(
  [switch]$Elevated,
  [switch]$Quiet
)

$ErrorActionPreference = 'Continue'
$Title = "Vantage WinUpdater"
$LogFile = Join-Path $env:TEMP "Vantage-WinUpdater-uninstall.log"
$UninstallKey = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage WinUpdater'

function Write-Log([string]$Message) {
  try {
    $Line = "{0} {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Message
    Add-Content -Path $LogFile -Value $Line -Encoding UTF8 -ErrorAction SilentlyContinue
  } catch {}
}

function Show-Error([string]$Message) {
  Write-Log "ERROR: $Message"
  if ($Quiet) { return }
  try {
    Add-Type -AssemblyName PresentationFramework -ErrorAction SilentlyContinue
    [System.Windows.MessageBox]::Show($Message, $Title, 'OK', 'Warning') | Out-Null
  } catch {}
}

# Stop the updater and get rid of its scheduled task first: even when the
# remaining cleanup fails, it must not keep running in the background.
function Stop-ScheduledTasks {
  try {
    $Tasks = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like 'Vantage WinUpdater*' }
    foreach ($Task in $Tasks) {
      Write-Log "Disabling scheduled task '$($Task.TaskName)'"
      Disable-ScheduledTask -TaskName $Task.TaskName -TaskPath $Task.TaskPath -ErrorAction SilentlyContinue | Out-Null
      Write-Log "Removing scheduled task '$($Task.TaskName)'"
      Unregister-ScheduledTask -TaskName $Task.TaskName -TaskPath $Task.TaskPath -Confirm:$false -ErrorAction SilentlyContinue
    }
  } catch {
    Write-Log "Scheduled task cleanup failed: $($_.Exception.Message)"
  }

  # Fallback for systems where the ScheduledTasks module is unavailable.
  & schtasks.exe /delete /tn ("Vantage WinUpdater ({0})" -f [Environment]::UserName) /f 2>$null | Out-Null
}

function Stop-UpdaterProcesses {
  Get-Process -Name 'Vantage-WinUpdater' -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Log "Stopping process $($_.Id)"
    Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue
  }
  Start-Sleep -Milliseconds 500
}

function Remove-Component {
  # Runtime copy under %APPDATA%\Vantage\WinUpdater.
  $AppDataDir = Join-Path ([Environment]::GetFolderPath('ApplicationData')) "Vantage\WinUpdater"
  if (Test-Path -LiteralPath $AppDataDir) {
    Write-Log "Removing $AppDataDir"
    Remove-Item -LiteralPath $AppDataDir -Recurse -Force -ErrorAction SilentlyContinue
    if (Test-Path -LiteralPath $AppDataDir) {
      Write-Log "WARNING: $AppDataDir still exists"
    }
  }

  # Add/Remove Programs entry (current user and machine-wide, both registry
  # views: the installer itself is 32-bit).
  & reg.exe delete "HKCU\$UninstallKey" /f 2>$null | Out-Null
  & reg.exe delete "HKLM\$UninstallKey" /f /reg:32 2>$null | Out-Null
  & reg.exe delete "HKLM\$UninstallKey" /f /reg:64 2>$null | Out-Null

  # Component directory. Try immediately; if a file is still locked, let a
  # detached cmd.exe retry after this process has exited.
  $InstallDir = $PSScriptRoot
  if ($InstallDir -and (Test-Path -LiteralPath $InstallDir)) {
    Write-Log "Removing $InstallDir"
    Remove-Item -LiteralPath $InstallDir -Recurse -Force -ErrorAction SilentlyContinue

    if (Test-Path -LiteralPath $InstallDir) {
      Write-Log "Directory still present; scheduling deferred removal"
      $CleanupScript = Join-Path $env:TEMP "vantage-winupdater-cleanup.cmd"
      $CleanupContent = "@echo off`r`nping -n 3 127.0.0.1 >nul`r`nrd /s /q `"$InstallDir`"`r`n(goto) 2>nul & del /f /q `"%~f0`"`r`n"

      try {
        Set-Content -LiteralPath $CleanupScript -Value $CleanupContent -Encoding ASCII -ErrorAction Stop
        $CmdExe = Join-Path $env:SystemRoot 'System32\cmd.exe'
        Start-Process -FilePath $CmdExe -ArgumentList ('/c "{0}"' -f $CleanupScript) -WorkingDirectory $env:TEMP -WindowStyle Hidden | Out-Null
      } catch {
        Write-Log "Deferred removal failed: $($_.Exception.Message)"
      }
    }
  }
}

Write-Log "--- Uninstall started (elevated=$Elevated quiet=$Quiet) ---"

# 1. Elevate when needed. The Add/Remove Programs entry lives in HKCU, so
#    Windows Settings starts this script without elevation and files under
#    Program Files (plus the scheduled task) cannot be removed from there.
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
Write-Log "Administrator: $IsAdmin"

if (-not $IsAdmin) {
  if ($Elevated) {
    # Already asked for elevation once; do not loop.
    Write-Log "Elevation did not take effect"
  } else {
    try {
      $ArgumentLine = '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "{0}" -Elevated' -f $PSCommandPath
      if ($Quiet) { $ArgumentLine += ' -Quiet' }
      Write-Log "Re-launching elevated: $ArgumentLine"
      $Process = Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList $ArgumentLine -Wait -PassThru
      Write-Log "Elevated helper exit code: $($Process.ExitCode)"
      exit $Process.ExitCode
    } catch {
      Write-Log "Elevation failed or was cancelled: $($_.Exception.Message)"
    }
  }

  # Fallback: no administrator rights. Disable the scheduled task and clear
  # what the current user can remove, so the updater at least stops running.
  Stop-ScheduledTasks
  Stop-UpdaterProcesses
  Remove-Component
  Show-Error ("Vantage WinUpdater was removed from the app list and its background update task was disabled, but files under Program Files could not be removed without administrator rights.`n`nRun the uninstaller again and allow the UAC prompt to remove them completely.`n`nDetails: {0}" -f $LogFile)
  exit 1
}

# 2. Full cleanup with administrator rights.
Stop-ScheduledTasks
Stop-UpdaterProcesses
Remove-Component

Write-Log "Done."
exit 0
