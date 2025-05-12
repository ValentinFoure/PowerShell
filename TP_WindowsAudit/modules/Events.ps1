# Récupère les 20 dernières erreurs du journal Système
Get-EventLog -LogName System -EntryType Error -Newest 20 |
Select-Object TimeGenerated, Source, EventID, Message |
Format-Table -Wrap -AutoSize