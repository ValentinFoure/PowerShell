# Récupère le nom du PC
$computerName = $env:COMPUTERNAME
Write-Output "Nom du PC : $computerName"

# Récupère les informations du système (Fabricant, Modèle)
$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem
Write-Output "Fabricant : $($computerSystem.Manufacturer)"
Write-Output "Modèle : $($computerSystem.Model)"

# Récupère les informations de RAM
$physicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory
$totalMemoryGB = ($physicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
$memoryTypes = @{
    0 = "Unknown"; 1 = "Other"; 2 = "DRAM"; 3 = "Synchronous DRAM"; 4 = "Cache DRAM";
    5 = "EDO"; 6 = "EDRAM"; 7 = "VRAM"; 8 = "SRAM"; 9 = "RAM"; 10 = "ROM";
    11 = "Flash"; 12 = "EEPROM"; 13 = "FEPROM"; 14 = "EPROM"; 15 = "CDRAM";
    16 = "3DRAM"; 17 = "SDRAM"; 18 = "SGRAM"; 19 = "RDRAM"; 20 = "DDR"; 
    21 = "DDR2"; 22 = "DDR2 FB-DIMM"; 24 = "DDR3"; 25 = "FBD2"; 26 = "DDR4"
}
$memoryType = $memoryTypes[($physicalMemory | Select-Object -First 1).MemoryType]
Write-Output "Type de RAM : $memoryType"
Write-Output ("Quantité de RAM : {0:N2} Go" -f $totalMemoryGB)

# Récupère les informations du processeur
$cpu = Get-CimInstance -ClassName Win32_Processor
Write-Output "Processeur : $($cpu.Name)"

# Récupère les informations des disques
$drives = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
foreach ($drive in $drives) {
    $sizeGB = [math]::Round($drive.Size / 1GB, 2)
    $freeGB = [math]::Round($drive.FreeSpace / 1GB, 2)
    Write-Output "Disque $($drive.DeviceID) - Taille : $sizeGB Go - Libre : $freeGB Go"
}