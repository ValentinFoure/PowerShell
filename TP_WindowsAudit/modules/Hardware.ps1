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
$diskInfo = $disks | Select-Object DeviceID, @{Name="Taille (Go)"; Expression={[math]::round($_.Size / 1GB, 2)}}, @{Name="Libre (Go)"; Expression={[math]::round($_.FreeSpace / 1GB, 2)}}
$hardwareInfo["Disques"] = $diskInfo

$hardwareInfo