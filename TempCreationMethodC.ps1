if (-not (Test-Path -Path "C:\Temp"))
{
    Write-Host "Folder does not exist, creating new"
    New-Item -Path "C:\Temp" -ItemType Directory
}