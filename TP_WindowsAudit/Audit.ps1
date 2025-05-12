# Importation des modules
. .\modules\Hardware.ps1
. .\modules\Software.ps1
. .\modules\Security.ps1
. .\modules\Performance.ps1
. .\modules\Events.ps1
. .\modules\Users.ps1
. .\modules\Network.ps1
. .\modules\Devices.ps1
. .\modules\OS.ps1

# Récupérer les informations
$hardware = .\modules\Hardware.ps1
$software = .\modules\Software.ps1
$security = .\modules\Security.ps1
$performance = .\modules\Performance.ps1
$events = .\modules\Events.ps1
$users = .\modules\Users.ps1
$network = .\modules\Network.ps1
$devices = .\modules\Devices.ps1
$os = .\modules\OS.ps1

# Créer le rapport
$report = @()
$report += "#################### Audit Complet - Rapport ####################"
$report += "Nom du PC : $($hardware['Nom du PC'])"
$report += "Fabricant : $($hardware['Fabricant'])"
$report += "Modèle : $($hardware['Modèle'])"
$report += "Processeur : $($hardware['Processeur'])"
$report += "RAM : $($hardware['RAM'])"
$report += "Disques : $($hardware['Disques'])"
$report += "Logiciels installés : $($software)"
$report += "Sécurité : $($security)"
$report += "Utilisation actuelle : $($performance)"
$report += "Événements récents : $($events)"
$report += "Comptes locaux : $($users)"
$report += "Imprimantes et périphériques : $($devices)"
$report += "Informations réseau : $($network)"
$report += "Système d'exploitation : $($os)"

# Sauvegarder dans le fichier de sortie
$report | Out-File -FilePath .\output\RapportAudit.txt

# Audit.ps1

$outputPath = ".\output"
if (!(Test-Path $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath | Out-Null
}

$rapport = @()
$rapport += "#################### Audit Complet - Rapport ####################`n"

$modules = @(
    "Hardware",
    "Software",
    "Security",
    "Performance",
    "Events",
    "Users",
    "Network",
    "Devices",
    "OS"
)

foreach ($module in $modules) {
    $path = ".\modules\$module.ps1"
    $rapport += "`n===== $module ====="

    if (Test-Path $path) {
        try {
            $data = & $path

            if ($data -is [System.Collections.IDictionary]) {
                foreach ($key in $data.Keys) {
                    $rapport += "$key : $($data[$key])"
                }
            }
            elseif ($data -is [System.Collections.IEnumerable] -and !$data.GetType().IsPrimitive -and $data -ne $null) {
                $rapport += $data | Out-String
            }
            else {
                $rapport += "$data"
            }

            $rapport += "`n"
        }
        catch {
            $rapport += "Erreur lors de l'exécution du module $module : $_`n"
        }
    }
    else {
        $rapport += "Module non trouvé : $module.ps1`n"
    }
}

$rapportPath = Join-Path $outputPath "RapportAudit.txt"
$rapport | Out-File -FilePath $rapportPath -Encoding UTF8

Write-Host "Rapport généré avec succès : $rapportPath"