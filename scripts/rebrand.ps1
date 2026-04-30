#
# rebrand.ps1 - 合并 LibreWolf 上游后，自动将路径相关的 LibreWolf 引用替换为 Vantage
#
# 用法: 拉取 LibreWolf 上游更新后，在项目根目录运行:
#   .\scripts\rebrand.ps1
#
# 只替换影响用户数据路径的内容，不动 pref key、注释、URL、内部资源文件名
#

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Push-Location $root

Write-Host "=== Vantage Rebrand Script ===" -ForegroundColor Cyan
Write-Host ""

# --- Helper: 读取文件 -> 替换 -> 写回 (保留 LF 换行) ---
function Replace-InFile {
    param(
        [string]$Path,
        [hashtable[]]$Replacements
    )
    $content = [System.IO.File]::ReadAllText($Path)
    foreach ($r in $Replacements) {
        $content = $content.Replace($r.Old, $r.New)
    }
    # 保留 Unix 换行符 (LF)，不转换为 CRLF
    [System.IO.File]::WriteAllText($Path, $content, [System.Text.UTF8Encoding]::new($false))
}

# --- 1. patches/moz-configure.patch ---
$file1 = "patches\moz-configure.patch"
Write-Host "[1/3] $file1"
Replace-InFile -Path $file1 -Replacements @(
    @{ Old = 'default="LibreWolf"'; New = 'default="Vantage"' },
    @{ Old = 'default="librewolf"'; New = 'default="vantage"' }
)
Write-Host "  MOZ_APP_VENDOR -> Vantage, MOZ_APP_PROFILE -> vantage" -ForegroundColor Green

# --- 2. patches/mozilla_dirs.patch ---
$file2 = "patches\mozilla_dirs.patch"
Write-Host "[2/3] $file2"
Replace-InFile -Path $file2 -Replacements @(
    @{ Old = '"LibreWolf"_ns';  New = '"Vantage"_ns' },
    @{ Old = '".librewolf"_ns'; New = '".vantage"_ns' },
    @{ Old = '/librewolf/extensions'; New = '/vantage/extensions' },
    @{ Old = '"LibreWolf"';     New = '"Vantage"' },
    @{ Old = '".librewolf"';    New = '".vantage"' }
)
Write-Host "  All hardcoded dir paths -> Vantage/.vantage" -ForegroundColor Green

# --- 3. settings/librewolf.cfg (overrides.cfg 加载路径) ---
$file3 = "settings\librewolf.cfg"
Write-Host "[3/3] $file3"
Replace-InFile -Path $file3 -Replacements @(
    @{ Old = '.includes(".librewolf")'; New = '.includes(".vantage")' },
    @{ Old = 'librewolf/librewolf/librewolf.overrides.cfg'; New = 'vantage/vantage/vantage.overrides.cfg' },
    @{ Old = '.librewolf/librewolf.overrides.cfg'; New = '.vantage/vantage.overrides.cfg' }
)
Write-Host "  overrides.cfg paths -> .vantage/vantage.overrides.cfg" -ForegroundColor Green

# --- 验证 ---
Write-Host ""
Write-Host "=== Verify (should show no results for mozilla_dirs.patch) ===" -ForegroundColor Yellow
Write-Host "--- moz-configure.patch ---"
Select-String -Path $file1 -Pattern "librewolf|LibreWolf" -CaseSensitive | ForEach-Object { Write-Host "  $_" }
Write-Host "--- mozilla_dirs.patch ---"
Select-String -Path $file2 -Pattern "librewolf|LibreWolf" -CaseSensitive | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
Write-Host "--- librewolf.cfg overrides ---"
Select-String -Path $file3 -Pattern "overrides" | ForEach-Object { Write-Host "  $_" }

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Cyan

Pop-Location
