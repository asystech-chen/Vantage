# msix-service.ps1 - minimal HTTP API for packing Vantage MSIX on a Windows host
#
# ASCII-only by design: Windows PowerShell 5.1 parses .ps1 as ANSI (GBK/CP936 on
# a Chinese system) unless the file carries a UTF-8 BOM, so non-ASCII would break
# parsing.
#
# Endpoints (all require: Authorization: Bearer <token>):
#   GET    /v1/health                 -> {ok, service, makeappx, free_gb}
#   GET    /v1/jobs                   -> {jobs:[{name,size_mb,mtime}]}
#   POST   /v1/pack?arch=x86_64|aarch64
#          body = *.msix-prepackage.zip
#          -> {job, out, size_mb, sha256, unzip_sec, pack_sec}
#   GET    /v1/artifact/<name>        -> the .msix bytes
#   DELETE /v1/jobs/<job>             -> remove that job's in/work/out files
#
# Hardening notes:
#   - only two request parameters exist (arch). Paths are chosen by the server.
#   - makeappx is invoked with fixed arguments; nothing from the request is
#     passed to a shell.
#   - intended to run as a NON-admin local account with write access only to
#     $Root; see msix-service-install.ps1.

param(
    [int]$Port = 38417,
    [string]$Root = 'D:\vantage-msix',
    [long]$MaxBytes = 858993459
)
# $MaxBytes = 858993459 bytes = 800 MB (max upload size)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

$InDir = Join-Path $Root 'in'
$WorkDir = Join-Path $Root 'work'
$OutDir = Join-Path $Root 'out'
$LogDir = Join-Path $Root 'logs'
$ToolExe = Join-Path $Root 'tools\makeappx.exe'
$TokenFile = Join-Path $Root 'secrets\token.txt'
$LogFile = Join-Path $LogDir 'service.log'

foreach ($d in @($InDir, $WorkDir, $OutDir, $LogDir)) {
    if (-not (Test-Path $d)) { New-Item -ItemType Directory -Force -Path $d | Out-Null }
}

function Write-Log([string]$msg) {
    $line = "{0} {1}" -f ([DateTime]::Now.ToString('yyyy-MM-dd HH:mm:ss')), $msg
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
}

function Get-Token {
    if (-not (Test-Path $TokenFile)) { return '' }
    return (Get-Content -Path $TokenFile -Raw).Trim()
}

function Test-Token([string]$given) {
    $want = Get-Token
    if ([string]::IsNullOrEmpty($want)) { return $false }
    if ([string]::IsNullOrEmpty($given)) { return $false }
    $a = [Text.Encoding]::UTF8.GetBytes($given)
    $b = [Text.Encoding]::UTF8.GetBytes($want)
    if ($a.Length -ne $b.Length) { return $false }
    $diff = 0
    for ($i = 0; $i -lt $a.Length; $i++) { $diff = $diff -bor ($a[$i] -bxor $b[$i]) }
    return ($diff -eq 0)
}

function Send-Json($ctx, [int]$code, $obj) {
    $json = $obj | ConvertTo-Json -Depth 5 -Compress
    $bytes = [Text.Encoding]::UTF8.GetBytes($json)
    $ctx.Response.StatusCode = $code
    $ctx.Response.ContentType = 'application/json; charset=utf-8'
    $ctx.Response.ContentLength64 = $bytes.Length
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    $ctx.Response.Close()
}

function Send-Text($ctx, [int]$code, [string]$text) {
    $bytes = [Text.Encoding]::UTF8.GetBytes($text)
    $ctx.Response.StatusCode = $code
    $ctx.Response.ContentType = 'text/plain; charset=utf-8'
    $ctx.Response.ContentLength64 = $bytes.Length
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    $ctx.Response.Close()
}

function Get-Bearer($ctx) {
    $h = $ctx.Request.Headers['Authorization']
    if ($h -and $h.StartsWith('Bearer ')) { return $h.Substring(7).Trim() }
    return ''
}

function Get-Stage([string]$under) {
    return (Get-ChildItem $under -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -like 'msix-temp-*' } | Select-Object -First 1)
}

# --- pack: the only real work -------------------------------------------
function Invoke-Pack($ctx) {
    $arch = $ctx.Request.QueryString['arch']
    if ($arch -eq 'x86_64') { $archName = 'x86_64' }
    elseif ($arch -eq 'aarch64') { $archName = 'aarch64' }
    else { Send-Json $ctx 400 @{ error = 'arch must be x86_64 or aarch64' }; return }

    $len = $ctx.Request.ContentLength64
    if ($len -le 0) { Send-Json $ctx 411 @{ error = 'Content-Length required' }; return }
    if ($len -gt $MaxBytes) { Send-Json $ctx 413 @{ error = "payload too large (max $MaxBytes bytes)" }; return }

    $stamp = [DateTime]::Now.ToString('yyyyMMdd-HHmmss')
    $job = "$stamp-$archName"
    $zipPath = Join-Path $InDir "$job.zip"
    $workJob = Join-Path $WorkDir $job
    $outName = "vantage-$job.msix"
    $outPath = Join-Path $OutDir $outName

    Write-Log "PACK start job=$job bytes=$len"
    try {
        $fs = [IO.File]::Create($zipPath)
        $ctx.Request.InputStream.CopyTo($fs)
        $fs.Close()

        if (Test-Path $workJob) { Remove-Item $workJob -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $workJob | Out-Null

        $sw = [Diagnostics.Stopwatch]::StartNew()
        Expand-Archive -Path $zipPath -DestinationPath $workJob -Force
        $unzip = $sw.Elapsed.TotalSeconds

        $stage = Get-Stage $workJob
        if (-not $stage) { throw "no msix-temp-* directory in the uploaded zip" }

        if (Test-Path $outPath) { Remove-Item $outPath -Force }
        $sw.Restart()
        $log = & $ToolExe pack /d $stage.FullName /p $outPath /overwrite 2>&1
        if ($LASTEXITCODE -ne 0) {
            $log | ForEach-Object { Write-Log "  makeappx: $_" }
            throw "makeappx pack failed (exit=$LASTEXITCODE)"
        }
        $pack = $sw.Elapsed.TotalSeconds

        $sha = (Get-FileHash $outPath -Algorithm SHA256).Hash.ToLower()
        $mb = [Math]::Round((Get-Item $outPath).Length / 1MB, 1)
        Write-Log ("PACK done job={0} out={1} size={2}MB unzip={3:N1}s pack={4:N1}s sha={5}" -f $job, $outName, $mb, $unzip, $pack, $sha)
        Send-Json $ctx 200 @{
            job = $job; out = $outName; size_mb = $mb; sha256 = $sha;
            unzip_sec = [Math]::Round($unzip, 1); pack_sec = [Math]::Round($pack, 1)
        }
    }
    catch {
        Write-Log "PACK error job=$job : $_"
        Send-Json $ctx 500 @{ error = "$_" }
    }
}

# --- main loop ----------------------------------------------------------
$prefix = "http://+:$Port/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
try {
    $listener.Start()
} catch {
    Write-Log "FATAL: cannot start listener on $prefix : $_"
    throw
}
Write-Log "service started on $prefix (root=$Root, account=$env:USERDOMAIN\$env:USERNAME)"

while ($listener.IsListening) {
    $ctx = $null
    try { $ctx = $listener.GetContext() } catch { break }
    if (-not $ctx) { continue }

    $path = $ctx.Request.Url.AbsolutePath.TrimEnd('/')
    if ($path -eq '') { $path = '/' }
    $method = $ctx.Request.HttpMethod

    try {
        if (-not (Test-Token (Get-Bearer $ctx))) {
            Write-Log "401 $method $path from $($ctx.Request.RemoteEndPoint)"
            Send-Json $ctx 401 @{ error = 'unauthorized' }
            continue
        }

        switch -Regex ("$method $path") {
            '^GET /v1/health$' {
                $mk = if (Test-Path $ToolExe) { (& $ToolExe | Select-String 'Version' | Select-Object -First 1).ToString().Trim() } else { 'MISSING' }
                Send-Json $ctx 200 @{
                    ok = $true; service = 'vantage-msix'; port = $Port
                    makeappx = $mk
                    free_gb = [Math]::Round((Get-PSDrive ($Root.Substring(0, 1))).Free / 1GB, 1)
                    time = [DateTime]::Now.ToString('s')
                }
                continue
            }
            '^GET /v1/jobs$' {
                $jobs = @(Get-ChildItem $OutDir -File -Filter '*.msix' -ErrorAction SilentlyContinue |
                    Sort-Object LastWriteTime -Descending | Select-Object -First 50 |
                    ForEach-Object { @{ name = $_.Name; size_mb = [Math]::Round($_.Length / 1MB, 1); mtime = $_.LastWriteTime.ToString('s') } })
                Send-Json $ctx 200 @{ jobs = $jobs }
                continue
            }
            '^POST /v1/pack' { Invoke-Pack $ctx; continue }
            '^GET /v1/artifact/' {
                $name = [Uri]::UnescapeDataString($path.Substring('/v1/artifact/'.Length))
                if ($name -notmatch '^[A-Za-z0-9._-]+\.msix$') { Send-Json $ctx 400 @{ error = 'bad name' }; continue }
                $full = Join-Path $OutDir $name
                if (-not (Test-Path $full)) { Send-Json $ctx 404 @{ error = 'not found' }; continue }
                $fi = Get-Item $full
                $ctx.Response.StatusCode = 200
                $ctx.Response.ContentType = 'application/octet-stream'
                $ctx.Response.ContentLength64 = $fi.Length
                $ctx.Response.AddHeader('Content-Disposition', "attachment; filename=$name")
                $fstream = [IO.File]::OpenRead($full)
                $fstream.CopyTo($ctx.Response.OutputStream)
                $fstream.Close()
                $ctx.Response.Close()
                Write-Log "SERVE $name ($([Math]::Round($fi.Length/1MB,1))MB)"
                continue
            }
            '^DELETE /v1/jobs/' {
                $job = [Uri]::UnescapeDataString($path.Substring('/v1/jobs/'.Length))
                if ($job -notmatch '^[A-Za-z0-9._-]+$') { Send-Json $ctx 400 @{ error = 'bad job' }; continue }
                $removed = 0
                foreach ($p in @((Join-Path $InDir "$job.zip"), (Join-Path $WorkDir $job), (Join-Path $OutDir "$job.msix"))) {
                    if (Test-Path $p) { Remove-Item $p -Recurse -Force; $removed++ }
                }
                Send-Json $ctx 200 @{ job = $job; removed = $removed }
                continue
            }
            default { Send-Json $ctx 404 @{ error = 'not found' } }
        }
    }
    catch {
        Write-Log "500 $method $path : $_"
        try { Send-Json $ctx 500 @{ error = "$_" } } catch { }
    }
}

$listener.Stop()
Write-Log 'service stopped'
