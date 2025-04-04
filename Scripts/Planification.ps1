Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "AuditTask" -Description "Exécute le script d'audit chaque jour à 10h"

Get-ScheduledTask

Get-ScheduledTask | Where-Object {$_.TaskName -eq "AuditTask"}
