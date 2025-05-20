param([string]$a = "janvier", [string]$b = "avril")
$max = [Math]::Max($a.Length, $b.Length)
$result = ""
for ($i = 0; $i -lt $max; $i++) {
    if ($i -lt $a.Length) { $result += $a[$i] }
    if ($i -lt $b.Length) { $result += $b[$i] }
}
Write-Output $result