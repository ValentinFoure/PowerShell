function Show-JobStatus {
    param ($job)
    if ($job.State -eq 'Completed') {
        Write-Host "Tâche terminée."
        Receive-Job -Job $job
    } elseif ($job.State -eq 'Failed') {
        Write-Error "Tâche échouée."
    } else {
        Write-Host "⏳ Tâche en cours..."
    }
}