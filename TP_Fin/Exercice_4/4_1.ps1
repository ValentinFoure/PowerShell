param(
    [string]$source = "C:\Source",
    [string]$destination = "C:\Destination"
)
Get-ChildItem $source -File | ForEach-Object {
    $destFile = Join-Path $destination $_.Name
    if (!(Test-Path $destFile) -or ($_.LastWriteTime -gt (Get-Item $destFile).LastWriteTime)) {
        Copy-Item $_.FullName -Destination $destFile
        Write-Host "Copié : $($_.Name)"
    }
}