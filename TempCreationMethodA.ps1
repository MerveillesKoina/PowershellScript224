# Writing a script to create new folder (C:\Temp)

# Method A
#Define variable
$folderPresent = Test-Path "C:\Temp"
if ($folderPresent -eq $true)
{
    Write-Warning "Folder Exists ..."
}
else
{
    Write-Host "Folder does exist, creating new"
    New-Item -Path "C:\Temp" -ItemType Directory
}