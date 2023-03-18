# Importing the StudentInfo file 
$data = Import-Csv C:\scripts\StudentInfo.Csv


#Using the foreach loop
foreach ($mydata in $data)
{
    $lastName = $mydata.LastName
    $firstName = $mydata.FirstName
    Write-Host "Official Name: $lastName, $firstName"
}

# Creating a file called numbers.txt in the Script folder
$fileName = "C:\Scripts\numbers.txt"
if ( -not (Test-Path -Path $fileName))
{
    Write-Host "Folder does not exist, creating new"
    New-Item -Path $fileName -ItemType File -Force
}

# We are going to save the following values in that file: 10, 15, -4, -9, and 7

10, 15, -4, -9, 7 | Out-File $fileName -Append

# We are going to test "each value" using the Foreach cmdlet

Get-Content $fileName | foreach {
    [int]$currentNumber = $_
    if ($currentNumber -gt 0)
    {
        Write-Host "$_ is positive" -f Green
    }
    else
    {
        Write-Host "$_ is negative" -f Red
    }
}

#Creating a variable called $files that will contain all the files starting from C:\program Files and use the foreach () and if() statements that only displays the files with extension ".txt"
$files = Get-ChildItem 'C:\Program Files' -Recurse -Force
#$files.Count
foreach ($txtFiles in $files)
{
    if ($txtFiles.Extension -eq ".txt")
    {
        Write-Host ("$txtFiles")
    }
}



# Write code using a foreach() loop to display just the "Message" property each of the 100 logs
# Let's collect the newest 100 EventLogs from the application log
$myEvents = Get-EventLog -LogName Application -Newest 100

# Displaying the Message property of each log using the foreach loop
foreach($events in $myEvents)
{
    Write-Host ($events.Message)
}

Get-CimInstance -ClassName Win32_LogicalDisk
# Saving the output of Get-CimInstance to a variable and using the foreach to go through each drive in the disks
$disks = Get-CimInstance -ClassName Win32_LogicalDisk

foreach ($drive in $disks)
{
    $driveName = $drive.Name
    $driveSize = $drive.Size
    Write-Host "$driveName = $driveSize"
}

# The output can still be refined to show GB instead of the awkward Bytes
$disks = Get-CimInstance -ClassName Win32_LogicalDisk

foreach ($drive in $disks)
{
    $driveName = $drive.Name
    $driveSize = $drive.Size/1GB
    Write-Host "$driveName = $driveSize"
}

# Let round off the value, we can make the calculation return an [int]
$disks = Get-CimInstance -ClassName Win32_LogicalDisk

foreach ($drive in $disks)
{
    $driveName = $drive.Name
    [int]$driveSize = $drive.Size/1GB
    Write-Host "$driveName = $driveSize"
}

# Let's find the first 20 numbers of the Fibonacci sequence.
# Starting fibonacci sequence
$fibonacci = @(0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#$fibonacci.Count

Write-Host "$($fibonacci[0]) " -NoNewline
Write-Host "$($fibonacci[1]) " -NoNewline

# Using the for loop
for ($i =2; $i -lt 20; $i++)
{
    $fibonacci[$i] = $fibonacci[$i-1] + $fibonacci[$i-2]
    $x = $fibonacci[$i]
    Write-Host "$x " -NoNewline
}