# grep → Select-String
Select-String "motif" fichier.txt

# find → Get-ChildItem -Recurse
Get-ChildItem -Recurse -Filter *.txt

# wc -l → nombre de lignes
(Get-Content fichier.txt).Count