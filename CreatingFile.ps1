# Creating a file name testfile in the Temp directory. The script should check whether or not the file is already created.

if (-not (Test-Path -Path "C:\Temp\testfile.txt"))
{
    Write-Host "File does not exist, creating new"
    New-Item -Path "C:\Temp\testfile.txt" -ItemType File
}