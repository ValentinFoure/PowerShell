$osInfo = @{}

# Récupération de l'objet système
$os = Get-WmiObject Win32_OperatingSystem

# Version de Windows
$osInfo["Version de Windows"] = $os.Caption

# ✅ Conversion correcte de la chaîne WMI en DateTime
$bootTime = [System.Management.ManagementDateTimeConverter]::ToDateTime($os.LastBootUpTime)

# Date de démarrage formatée
$osInfo["Date de démarrage"] = $bootTime.ToString("yyyy-MM-dd HH:mm:ss")

# ✅ Calcul du temps depuis le démarrage
$uptime = (Get-Date) - $bootTime
$osInfo["Uptime"] = "{0} jours {1} heures {2} minutes" -f $uptime.Days, $uptime.Hours, $uptime.Minutes

# Architecture
$architecture = if ($os.OSArchitecture -eq '64-bit') { "64 bits" } else { "32 bits" }
$osInfo["Architecture"] = $architecture

$osInfo