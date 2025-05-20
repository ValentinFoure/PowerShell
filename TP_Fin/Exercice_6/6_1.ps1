param([string]$file = "MarkTwain1.txt")
Get-Content $file |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match "sc" } |
    ForEach-Object { Write-Output $_ }