Remove-Item [System.IO.Path]::GetTempPath() -Force -Recurse -ErrorAction SilentlyContinue

Get-ChildItem