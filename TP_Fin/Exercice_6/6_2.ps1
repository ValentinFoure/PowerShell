(Get-Content $file |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match "sc" }).Count