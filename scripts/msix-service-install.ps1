# msix-service-install.ps1 - deploy the Vantage MSIX HTTP service on this host
#
# Run **elevated** on the Windows packaging host. Idempotent: safe to re-run.
#
#   powershell -NoProfile -ExecutionPolicy Bypass -File msix-service-install.ps1 -ClientIp <client-ip>
#
# ASCII-only by design (Windows PowerShell 5.1 parses .ps1 as ANSI unless it has
# a UTF-8 BOM).
#
# What it does:
#   1. create the directory layout under $Root
#   2. create $Root\secrets\token.txt (random bearer token) if missing
#   3. create a NON-admin local user $User (random password kept in
#      $Root\secrets\<user>.pass) and give it Modify on $Root
#   4. reserve the URL (netsh http add urlacl) for that account
#   5. firewall: allow inbound TCP $Port from $ClientIp only
#   6. register + start a scheduled task that runs the service at boot
#      (runs as $User, limited privilege, no interactive logon needed)
#   7. self-test GET /v1/health
#
# It never prints the token; read it with:
#   Get-Content <Root>\secrets\token.txt

param(
    [int]$Port = 38417,
    [string]$Root = 'D:\vantage-msix',
    [Parameter(Mandatory = $true)]
    [string]$ClientIp,
    [string]$User = 'msixsvc',
    [string]$TaskName = 'VantageMsixService',
    [string]$FwRuleName = 'Vantage MSIX API'
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

function Say([string]$m) { Write-Output ">>> $m" }

# --- 0. must be elevated -------------------------------------------------
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { throw 'this script must run elevated (Administrator)' }

$HostName = $env:COMPUTERNAME
$Account = "$HostName\$User"
$SvcDir = Join-Path $Root 'service'
$SecDir = Join-Path $Root 'secrets'
$TokenFile = Join-Path $SecDir 'token.txt'
$PassFile = Join-Path $SecDir "$User.pass"
$SvcScript = Join-Path $SvcDir 'msix-service.ps1'

# --- 1. layout ----------------------------------------------------------
Say 'creating directory layout'
foreach ($d in @($Root, $SvcDir, $SecDir, (Join-Path $Root 'in'), (Join-Path $Root 'work'), (Join-Path $Root 'out'), (Join-Path $Root 'logs'))) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
}

if (-not (Test-Path $SvcScript)) {
    $here = Join-Path $PSScriptRoot 'msix-service.ps1'
    if (Test-Path $here) { Copy-Item $here $SvcScript -Force } else { throw "msix-service.ps1 not found (expected next to this script or at $SvcScript)" }
}

# --- 2. token -----------------------------------------------------------
if (-not (Test-Path $TokenFile)) {
    Say 'generating bearer token'
    $bytes = New-Object byte[] 32
    [Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
    ($bytes | ForEach-Object { $_.ToString('x2') }) -join '' | Set-Content -Path $TokenFile -Encoding ASCII -NoNewline
} else {
    Say 'token already exists (kept)'
}

# --- 3. service account -------------------------------------------------
$acct = Get-LocalUser -Name $User -ErrorAction SilentlyContinue
if (-not $acct) {
    Say "creating local user $User (non-admin)"
    $pw = -join ((1..24) | ForEach-Object { 'abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'[(Get-Random -Max 56)] })
    $sec = ConvertTo-SecureString $pw -AsPlainText -Force
    New-LocalUser -Name $User -Password $sec -PasswordNeverExpires -AccountNeverExpires -Description 'Vantage MSIX packing API (no interactive use)' | Out-Null
    $pw | Set-Content -Path $PassFile -Encoding ASCII -NoNewline
} else {
    Say "local user $User already exists"
    if (-not (Test-Path $PassFile)) { throw "$User exists but $PassFile is missing; delete the user or restore the password file" }
}

# the account exists in Administrators only if someone put it there - refuse to continue
if ((Get-LocalGroupMember -Group 'Administrators' -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq $Account })) {
    throw "$Account must NOT be a member of Administrators"
}

Say 'granting filesystem rights'
& icacls.exe $Root /grant "${User}:(OI)(CI)M" /T /C /Q | Out-Null
& icacls.exe $SecDir /inheritance:r /grant 'Administrators:(OI)(CI)F' /grant 'SYSTEM:(OI)(CI)F' /grant "${User}:(OI)(CI)R" /Q | Out-Null

# --- 4. URL reservation -------------------------------------------------
Say "reserving url http://+:$Port/"
& netsh.exe http delete urlacl url="http://+:$Port/" 2>$null | Out-Null
& netsh.exe http add urlacl url="http://+:$Port/" user="$Account" | Out-Null

# --- 5. firewall --------------------------------------------------------
Say "firewall: allow TCP $Port from $ClientIp only"
Get-NetFirewallRule -DisplayName $FwRuleName -ErrorAction SilentlyContinue | Remove-NetFirewallRule
New-NetFirewallRule -DisplayName $FwRuleName -Direction Inbound -Action Allow -Protocol TCP `
    -LocalPort $Port -RemoteAddress $ClientIp -Profile Any | Out-Null

# --- 6. scheduled task --------------------------------------------------
# --- 6. batch-logon right + scheduled task ------------------------------
# A task registered with a stored password needs SeBatchLogonRight for that
# account (default holders: Administrators, Backup Operators, Performance Log
# Users - a plain local user is NOT included). Without it the task fails to
# start with 0x80070569.
Say "granting 'Log on as a batch job' to $Account"
$sid = (Get-LocalUser -Name $User).SID.Value
$inf = Join-Path $env:TEMP 'vantage-msix-rights.inf'
$sdb = Join-Path $env:TEMP 'vantage-msix-rights.sdb'
& secedit.exe /export /cfg $inf /quiet | Out-Null
$found = $false
$newLines = foreach ($l in (Get-Content $inf)) {
    if ($l -match '^SeBatchLogonRight\s*=') {
        $found = $true
        if ($l -match [regex]::Escape($sid)) { $l } else { $l.TrimEnd() + ",*$sid" }
    } else { $l }
}
if (-not $found) { $newLines += "SeBatchLogonRight = *$sid" }
$newLines | Set-Content -Path $inf -Encoding Unicode
& secedit.exe /configure /db $sdb /cfg $inf /areas USER_RIGHTS /quiet | Out-Null
Remove-Item $inf, $sdb -Force -ErrorAction SilentlyContinue

Say "registering scheduled task $TaskName (runs as $Account at boot)"
$action = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument "-NoProfile -NonInteractive -ExecutionPolicy Bypass -File `"$SvcScript`" -Port $Port -Root `"$Root`""
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries `
    -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -ExecutionTimeLimit ([TimeSpan]::Zero)
$pwPlain = (Get-Content -Path $PassFile -Raw).Trim()

Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue
Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger -Settings $settings `
    -User $Account -Password $pwPlain -RunLevel Limited | Out-Null
Start-ScheduledTask -TaskName $TaskName

# --- 7. self-test -------------------------------------------------------
Say 'waiting for the service to answer /v1/health ...'
$token = (Get-Content -Path $TokenFile -Raw).Trim()
$ok = $false
for ($i = 1; $i -le 20; $i++) {
    Start-Sleep -Milliseconds 700
    try {
        $r = Invoke-RestMethod -Uri "http://127.0.0.1:$Port/v1/health" -Headers @{ Authorization = "Bearer $token" } -TimeoutSec 5
        Say ("health ok: makeappx='{0}' free_gb={1}" -f $r.makeappx, $r.free_gb)
        $ok = $true
        break
    } catch { }
}
if (-not $ok) {
    Write-Output '--- task state ---'
    Get-ScheduledTask -TaskName $TaskName | Select-Object State | Format-List | Out-String
    Get-ScheduledTaskInfo -TaskName $TaskName | Format-List | Out-String
    throw 'service did not answer; check D:\vantage-msix\logs\service.log'
}

Say 'DONE'
Write-Output "PORT=$Port"
Write-Output "ROOT=$Root"
Write-Output "TOKEN_FILE=$TokenFile"
Write-Output "ACCOUNT=$Account"
Write-Output "FW_ALLOW=$ClientIp -> TCP $Port"
