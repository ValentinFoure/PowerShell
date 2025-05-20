param(
    [string]$file = "MarkTwain1.txt",
    [string]$motif = "th"
)
(Get-Content $file |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match $motif }).Count