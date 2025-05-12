$usersInfo = @{}

# Liste des utilisateurs locaux
$users = Get-WmiObject Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true }
$usersInfo["Utilisateurs locaux"] = $users.Name

# Liste des groupes locaux
$groups = Get-WmiObject Win32_Group | Where-Object { $_.LocalAccount -eq $true }
$usersInfo["Groupes locaux"] = $groups.Name

$usersInfo