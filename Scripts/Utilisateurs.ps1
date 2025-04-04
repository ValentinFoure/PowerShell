New-LocalUser -Name "NomUtilisateur" -Password (Read-Host "Mot de passe" -AsSecureString)

New-LocalUser -Name "NomUtilisateur" -Password (ConvertTo-SecureString "MotDePasse" -AsPlainText -Force)

Disable-LocalUser -Name "nomutilisateur"
Remove-LocalUser -Name "nomutilisateur"
