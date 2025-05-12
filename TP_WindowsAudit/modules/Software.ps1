$softwareInfo = @()

$softwareList = Get-WmiObject Win32_Product
foreach ($software in $softwareList) {
    $softwareInfo += [PSCustomObject]@{
        "Nom"        = $software.Name
        "Éditeur"    = $software.Vendor
        "Version"    = $software.Version
    }
}

$softwareInfo