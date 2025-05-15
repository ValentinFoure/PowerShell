# Lancer une tâche en arrière-plan
$scriptBlock = {
    Start-Sleep -Seconds 10  # Simule une tâche longue
    Get-ChildItem -Recurse C:\Users | Out-File -FilePath C:\Temp\rapport_fichiers.txt
}

$job = Start-Job -ScriptBlock $scriptBlock

# Vérifier état de la tâche
while ($job.State -eq 'Running') {
    Write-Host "Tâche en cours..."
    Start-Sleep -Seconds 2
}

# Récupération du résultat
if ($job.State -eq 'Completed') {
    Receive-Job -Job $job
    Write-Host "Tâche terminée avec succès."
} elseif ($job.State -eq 'Failed') {
    Write-Error "La tâche a échoué."
}

Remove-Job $job