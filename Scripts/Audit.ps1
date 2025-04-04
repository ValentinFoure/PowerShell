$SystemInfo = Get-ComputerInfo

$SystemInfo | ConvertTo-Json | Out-File -FilePath "C:\Users\Valentin Foure\Desktop\Dossier\Windows PowerShell\Projet\TP_PowerTaskManager\Exports\audit.json"