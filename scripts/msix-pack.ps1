<#
.SYNOPSIS
    Pack a Vantage MSIX prepackage zip into a .msix (runs on Windows).

.DESCRIPTION
    Uploaded and invoked by scripts/msix-remote.sh on the packaging host.
      1. Expand-Archive the *.msix-prepackage.zip
      2. Locate the inner msix-temp-* directory
      3. makeappx pack /d <dir> /p <out>.msix /overwrite
      4. Print OUT / SIZE_MB / SHA256 for the caller to verify

.NOTES
    This file is intentionally ASCII-only: Windows PowerShell 5.1 parses .ps1
    files as ANSI (GBK/CP936 on a Chinese system) unless they carry a UTF-8 BOM,
    so any non-ASCII character here would break parsing.

.PARAMETER Zip
    Windows path of the prepackage zip.
.PARAMETER Out
    Windows path of the output .msix.
.PARAMETER ToolsDir
    Directory holding makeappx.exe (default D:\vantage-msix\tools).
.PARAMETER WorkDir
    Extraction work directory (default D:\vantage-msix\work).
#>
param(
    [Parameter(Mandatory = $true)][string]$Zip,
    [Parameter(Mandatory = $true)][string]$Out,
    [string]$ToolsDir = 'D:\vantage-msix\tools',
    [string]$WorkDir = 'D:\vantage-msix\work'
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

if (-not (Test-Path $Zip)) { throw "input zip not found: $Zip" }

$mk = Join-Path $ToolsDir 'makeappx.exe'
if (-not (Test-Path $mk)) {
    throw ("makeappx.exe not found: $mk" + "`n" +
        'Get it from the NuGet package Microsoft.Windows.SDK.BuildTools ' +
        '(copy the whole bin\<ver>\x64\ directory).')
}

New-Item -ItemType Directory -Force -Path $WorkDir, (Split-Path $Out) | Out-Null

# Per-zip work directory so a previous architecture can never leak into this run
$stageParent = Join-Path $WorkDir ([IO.Path]::GetFileNameWithoutExtension($Zip))
if (Test-Path $stageParent) { Remove-Item $stageParent -Recurse -Force }
New-Item -ItemType Directory -Force -Path $stageParent | Out-Null

$sw = [Diagnostics.Stopwatch]::StartNew()
Expand-Archive -Path $Zip -DestinationPath $stageParent -Force
Write-Output ("UNZIP_SEC={0:N1}" -f $sw.Elapsed.TotalSeconds)

$stage = Get-ChildItem $stageParent -Directory |
    Where-Object { $_.Name -like 'msix-temp-*' } | Select-Object -First 1
if (-not $stage) { throw "no msix-temp-* directory found under $stageParent" }

if (Test-Path $Out) { Remove-Item $Out -Force }

$sw = [Diagnostics.Stopwatch]::StartNew()
$log = & $mk pack /d $stage.FullName /p $Out /overwrite 2>&1
if ($LASTEXITCODE -ne 0) {
    $log | Write-Output
    throw "makeappx pack failed (exit=$LASTEXITCODE)"
}
Write-Output ("PACK_SEC={0:N1}" -f $sw.Elapsed.TotalSeconds)

Write-Output "OUT=$Out"
Write-Output ("SIZE_MB=" + [Math]::Round((Get-Item $Out).Length / 1MB, 1))
Write-Output ("SHA256=" + (Get-FileHash $Out -Algorithm SHA256).Hash.ToLower())
