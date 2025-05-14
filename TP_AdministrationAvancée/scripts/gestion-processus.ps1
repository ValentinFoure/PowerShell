# Import des fonctions utilitaires
. "$PSScriptRoot\utils.ps1"

Write-Host "Lancement d'une tâche en arrière-plan..."

$job = Start-Job -ScriptBlock {
    Start-Sleep -Seconds 10
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
}

# Suivi de l'état
while ($job.State -eq 'Running') {
    Write-Host "Tâche en cours..."
    Start-Sleep -Seconds 5
}

# Gestion des erreurs
if ($job.State -eq 'Completed') {
    Write-Host "Tâche terminée avec succès."
    Receive-Job $job
} else {
    Write-ErrorLog "La tâche a échoué ou été annulée."
}

Remove-Job $job