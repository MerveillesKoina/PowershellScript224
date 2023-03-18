# Exploring the New-Item cmdlet with appropriate try/catch block

Try
{
    # Let's create a folder called Activity3
    New-Item -ItemType Directory -Path "C:\Activity3" -ErrorAction Stop 

    # Let's Create two files called activity3.1.txt, and activity3.2.txt
    New-Item -ItemType File -Path "C:\Activity3\activity3.1.txt" -Value "This is a text string" -ErrorAction Stop
    New-Item -ItemType File -Path "C:\Activity3\activity3.2.txt" -Value "This is a text string" -ErrorAction Stop
    
    # Get the SHA256 hash of both the files individually
    # Let's define two variables called activity_1Hash and activity_2Hash
    $activity_1Hash = Get-FileHash -Path "C:\Activity3\activity3.1.txt" -Algorithm SHA256
    $activity_2Hash = Get-FileHash -Path "C:\Activity3\activity3.2.txt" -Algorithm SHA256
    
    # Printing out the SHA hash
    Write-Host "Activity3.1 SHA256 hash is: $($activity_1Hash.Hash)"
    Write-Host "Activity3.2 SHA256 hash is: $($activity_2Hash.Hash)"
}
Catch
{
    Write-Host "Error Creating Activity3 folder and files: $_. Exception Type: $($_.Exception.GetType().FullName)"
}



# Let's create an SMB share called FinalProject, and give full access to admins and readaccess to everyone
# We will embedded the code inside a try/catch block to handle any errors.

# Define a parameter called SmbCreation
$SmbCreation = @{
    Name = "FinalProject"
    Path = "C:\"
    FullAccess = "Administrators"
    ReadAccess = "Everyone"
}

New-SmbShare @SmbCreation


# Let's create a custom function called Get-UserInfo to display in a tabular format fora all the domain users


function Get-UserInfo{
    
    param(
        [Parameter(Mandatory = $true)]
        [string]$username
    )

    # Using the try/catch block
    try{
        $user = Get-ADUser -Identity $username -Properties Name, SamAccountName, 
        DistinguishedName -ErrorAction Stop

        $mytable = New-Object -TypeName PSObject -Property @{
        "Name" = $user.Name
        "SamAccountName" = $user.SamAccountName
        "DistinguishedName" = $user.DistinguishedName
        } | Select-Object Name, SamAccountName, DistinguishedName

        $mytable
    }
    catch
    {
        Write-Error $_
    }
}