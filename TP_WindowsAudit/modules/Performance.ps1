# --- Utilisation CPU ---
$cpuLoad = Get-CimInstance -ClassName Win32_Processor | Measure-Object -Property LoadPercentage -Average
Write-Output ("CPU utilisé : {0} %" -f $cpuLoad.Average)

# --- Utilisation RAM ---
$compSys = Get-CimInstance Win32_OperatingSystem
$totalRam = $compSys.TotalVisibleMemorySize
$freeRam = $compSys.FreePhysicalMemory
$usedRamPercent = [math]::Round((($totalRam - $freeRam) / $totalRam) * 100, 2)
Write-Output ("RAM utilisée : {0} %" -f $usedRamPercent)

# --- Disques (% d’espace libre) ---
$drives = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
foreach ($drive in $drives) {
    $total = $drive.Size
    $free = $drive.FreeSpace
    if ($total -gt 0) {
        $freePercent = [math]::Round(($free / $total) * 100, 2)
        Write-Output "Disque $($drive.DeviceID) - Espace libre : $freePercent %"
    }
}