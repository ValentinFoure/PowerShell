param([string]$file = "pays0.txt")
(Get-Content $file -Raw) -replace ';', ' ' -replace "`t", "`n"