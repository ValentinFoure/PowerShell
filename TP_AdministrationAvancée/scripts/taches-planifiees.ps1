$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\sauvegarde.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 2am
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

Register-ScheduledTask -TaskName "SauvegardeDossier" -Action $action -Trigger $trigger -Principal $principal