param(
    [string[]]$chaines = @("bonjour", "chez", "vousautres"),
    [string]$output = "fusion.txt"
)
$result = ""
$max = ($chaines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
for ($i = 0; $i -lt $max; $i++) {
    foreach ($s in $chaines) {
        if ($i -lt $s.Length) { $result += $s[$i] }
    }
}
Set-Content -Path $output -Value $result
Write-Host "Résultat sauvegardé dans $output"