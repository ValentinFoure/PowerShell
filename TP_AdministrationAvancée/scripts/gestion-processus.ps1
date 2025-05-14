# Importation des fonctions utilitaires
. "$PSScriptRoot\utils.ps1"

function Start-LongRunningTask {
    $scriptBlock = {
        Start-Sleep -Seconds 10
        Get-Process | Out-File -FilePath "$env:TEMP\process-report.txt"
    }
    
    $job = Start-Job -ScriptBlock $scriptBlock
    Write-Output "Tâche lancée avec l'ID : $($job.Id)"
    return $job
}

function Monitor-JobStatus {
    param($job)

    $job | Receive-Job -Wait -ErrorAction SilentlyContinue
    if ($job.State -eq 'Completed') {
        Write-Log -Message "Tâche terminée avec succès." -Level "INFO"
    } elseif ($job.State -eq 'Failed') {
        Write-Log -Message "Erreur lors de l'exécution de la tâche." -Level "ERROR"
    }
}

$job = Start-LongRunningTask
Monitor-JobStatus -job $job