Get-ChildItem "$C:\ValentinFoure\Downloads" -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force

Get-ChildItem -Path "C:\Chemin\Vers\Votre\Dossier" -Recurse -Filter "*.log" | Where-Object { $_.Length -gt 5MB } | Remove-Item -Force
