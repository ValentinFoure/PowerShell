$hardwareInfo = @{}

# Nom du PC
$hardwareInfo["Nom du PC"] = (Get-WmiObject Win32_ComputerSystem).Name

# Fabricant et modèle
$computerSystem = Get-WmiObject Win32_ComputerSystem
$hardwareInfo["Fabricant"] = $computerSystem.Manufacturer
$hardwareInfo["Modèle"] = $computerSystem.Model

# Processeur
$cpu = Get-WmiObject Win32_Processor
$hardwareInfo["Processeur"] = $cpu.Name

# RAM
$ram = [math]::round((Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
$hardwareInfo["RAM"] = "$ram Go"

# Disques
$disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"
$diskInfo = $disks | ForEach-Object {
    $id = $_.DeviceID
    $size = [math]::Round($_.Size / 1GB, 2)
    $free = [math]::Round($_.FreeSpace / 1GB, 2)
    "Disque $id : Taille = $size Go | Libre = $free Go"
}
$hardwareInfo["Disques"] = $diskInfo -join "`n"

$hardwareInfo