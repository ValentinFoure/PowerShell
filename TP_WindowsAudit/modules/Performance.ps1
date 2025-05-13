$performanceInfo = @{}

# Utilisation actuelle du CPU
$cpuUsage = Get-WmiObject Win32_Processor | Select-Object LoadPercentage
$performanceInfo["CPU"] = "$($cpuUsage.LoadPercentage)% utilisé"

# Utilisation actuelle de la RAM
$ramUsage = Get-WmiObject Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize
$usedRam = [math]::round(($ramUsage.TotalVisibleMemorySize - $ramUsage.FreePhysicalMemory) / 1MB, 2)
$totalRam = [math]::round($ramUsage.TotalVisibleMemorySize / 1MB, 2)
$performanceInfo["RAM"] = "$usedRam MB utilisés sur $totalRam MB"


# Espace libre sur les disques
$disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"
$diskLines = $disks | ForEach-Object {
    $drive = $_.DeviceID
    $percentFree = [math]::Round(($_.FreeSpace / $_.Size) * 100, 2)
    "Disque $drive : Espace Libre = $percentFree %"
}
$performanceInfo["Disques"] = $diskLines -join "`n"

$performanceInfo