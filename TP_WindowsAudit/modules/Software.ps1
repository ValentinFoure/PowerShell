# Récupération des logiciels installés via les clés de registre (32 et 64 bits)
$registryPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$softwareList = foreach ($path in $registryPaths) {
    Get-ItemProperty $path -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName } |
    Select-Object @{Name="Nom";Expression={$_.DisplayName}},
                  @{Name="Éditeur";Expression={$_.Publisher}},
                  @{Name="Version";Expression={$_.DisplayVersion}}
}

# Affichage à l'écran
$softwareList | Sort-Object Nom | Format-Table -AutoSize