Write-Output "Creating scheduled task for Vantage WinUpdater..."
$Title = "Vantage WinUpdater"
$Host.UI.RawUI.WindowTitle = $Title
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
If (-NOT $IsAdmin)
{
  # 非管理员上下文：不请求 UAC 提权（静默安装 /S 下 UAC 弹窗会挂起安装器），
  # 直接注册当前用户任务。WinUpdater 以普通用户运行，更新时由安装器自行提权。
  Write-Output "Non-elevated context: registering per-user scheduled task"
}

$Action   = New-ScheduledTaskAction -Execute "Vantage-WinUpdater.exe" -Argument "/Scheduled" -WorkingDirectory "$PSScriptRoot"
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DisallowHardTerminate -RunOnlyIfNetworkAvailable -StartWhenAvailable
$4Hours   = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Hours 4)
$AtLogon  = New-ScheduledTaskTrigger -AtLogOn
$AtLogon.Delay = 'PT1M'
$UserName = If ($Args[1]) {$Args[1]} Else {[Environment]::UserName}

If ($IsAdmin) {
  $User     = If ($Args[0]) {$Args[0]} Else {[System.Security.Principal.WindowsIdentity]::GetCurrent().Name}
  Register-ScheduledTask -TaskName "$Title ($UserName)" -Action $Action -Settings $Settings -Trigger $4Hours,$AtLogon -User $User -RunLevel Highest -Force
} Else {
  Register-ScheduledTask -TaskName "$Title ($UserName)" -Action $Action -Settings $Settings -Trigger $4Hours,$AtLogon -Force
}
Write-Output "Done."
