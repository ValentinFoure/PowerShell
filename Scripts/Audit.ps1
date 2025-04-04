# Nom du PC
$computerName = $env:COMPUTERNAME

# Version de l'OS
$osVersion = [System.Environment]::OSVersion.Version

# RAM (en Go)
$ram = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB

# Espace Disque
$diskSpaceUsed = (Get-PSDrive C).Used / 1GB
$diskSpaceFree = (Get-PSDrive C).Free / 1GB

# Uptime
$uptime = (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime

# Affichage des informations système
Write-Host "Nom du PC: $computerName"
Write-Host "Version de l'OS: $osVersion"
Write-Host "RAM: $([math]::round($ram, 2)) Go"
Write-Host "Espace disque utilisé: $([math]::round($diskSpaceUsed, 2)) Go"
Write-Host "Espace disque libre: $([math]::round($diskSpaceFree, 2)) Go"
Write-Host "Uptime: $uptime"

# 2. Lister les services en cours
$services = Get-Service | Select-Object Name, Status

# 3. Lister les utilisateurs locaux actifs
$localUsers = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true -and $_.Disabled -eq $false } | Select-Object Name

# 4. Créer un objet pour exporter les données
$results = @{
    ComputerName     = $computerName
    OSVersion        = $osVersion.ToString()
    RAM_GB           = [math]::round($ram, 2)
    DiskUsed_GB      = [math]::round($diskSpaceUsed, 2)
    DiskFree_GB      = [math]::round($diskSpaceFree, 2)
    Uptime           = $uptime
    Services         = $services
    ActiveUsers      = $localUsers.Name
}

# 5. Exporter les résultats dans un fichier JSON
$results | ConvertTo-Json -Depth 3 | Set-Content -Path "C:\AuditSystem\audit.json"

# 6. Exporter les résultats dans un fichier CSV
$results | Export-Csv -Path "C:\AuditSystem\audit.csv" -NoTypeInformation