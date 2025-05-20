param([string]$path = ".")
function Show-Tree($folder, $indent = "") {
    Write-Host "$indent+ $(Split-Path $folder -Leaf)"
    $items = Get-ChildItem $folder
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            Show-Tree $item.FullName "$indent  "
        } else {
            Write-Host "$indent  - $($item.Name)"
        }
    }
}
Show-Tree $path