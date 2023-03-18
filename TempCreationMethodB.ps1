if ((Test-Path -Path "C:\Temp") -eq $true)
{
    Write-Warning "Folder Exits ..."
}
else
{
    Write-Host "Folder does not exist, creating new"
    New-Item -Path "C:\Temp" -ItemType Directory
}