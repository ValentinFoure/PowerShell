# Liste des imprimantes
Get-Printer | Select-Object Name, DriverName, PortName | Format-Table -AutoSize

# Liste des périphériques USB actuellement branchés
Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -like 'USB*' } |
Select-Object FriendlyName, Manufacturer, Status | Format-Table -AutoSize