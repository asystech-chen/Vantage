Write-Output "Removing scheduled task for Vantage WinUpdater..."
$Title = "Vantage WinUpdater"
$Host.UI.RawUI.WindowTitle = $Title
$UserName = If ($Args[0]) {$Args[0]} Else {[Environment]::UserName}
Unregister-ScheduledTask -TaskName "$Title ($UserName)" -Confirm:$false -ErrorAction SilentlyContinue
Write-Output "Done. Press any key to close this window."
[Console]::ReadKey()
