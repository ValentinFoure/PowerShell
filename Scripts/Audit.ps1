$SystemInfo = Get-ComputerInfo

$SystemInfo | ConvertTo-Json | Out-File -FilePath "C:\Users\ValentinFoure\Desktop\Dossier\WindowsPowerShell\Projet\TP_PowerTaskManager\Exports\audit.json"