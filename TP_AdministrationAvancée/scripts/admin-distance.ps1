$remoteComputer = "NomMachineDistante"
$cred = Get-Credential

Invoke-Command -ComputerName $remoteComputer -Credential $cred -ScriptBlock {
    Get-Service | Where-Object {$_.Status -eq "Running"}
}