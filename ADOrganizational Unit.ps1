# Let's create a couple of Organizational Units.NBA under the root, nba east under nba, nba west under nba, bulls under nba east, lakers under the nba west and bad one under the root
# We will be using the New-ADOrganizationalUnit cmdlet

#Define variables names which will hold the distinguished name of our OU DCs
$mydomainName = "DC=mydomain, DC=local"
$mydomainName1 = "OU=NBA,DC=mydomain,DC=local"
$mydomainName2 = "OU=NBA_East,OU=NBA,DC=mydomain,DC=local"
$mydomainName3 = "OU=NBA_West,OU=NBA,DC=mydomain,DC=local"

# Creating NBA OU under the root
New-ADOrganizationalUnit -Name "NBA" -Path "$mydomainName"

# Creating NBA_East OU under NBA OU
New-ADOrganizationalUnit -Name "NBA_East" -Path "$mydomainName1"

# Creating NBA_West OU under NBA OU
New-ADOrganizationalUnit -Name "NBA_West" -Path "$mydomainName1"

# Creating Bulls OU under the NBA_East OU
New-ADOrganizationalUnit -Name "Bulls" -Path "$mydomainName2"

# Creating Lakers OU under the NBA_West OU
New-ADOrganizationalUnit -Name "Lakers" -Path "$mydomainName3"

# Creating Bad_One OU under the root OU
New-ADOrganizationalUnit -Name "Bad_One" -Path "$mydomainName"

# Listing all OUs with their Paths
Get-ADOrganizationalUnit -Filter 'Name -like "*"' | select Name, DistinguishedName

# Removing the Bad_One OU
# Let's define a variable to hold the OU path
$removeBadOU = "OU=Bad_One,DC=mydomain,DC=local"

# Using the Remove-ADOrganizationalUnit cmdlet
Set-ADOrganizationalUnit -Identity $removeBadOU -ProtectedFromAccidentalDeletion $false
Remove-ADOrganizationalUnit -Identity $removeBadOU 

#---------------------------------------------------------------------------
# Working with New-ADUser cmdlet
# Let's use Method-1 described in : https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2019-ps#examples
# to create a new user
# Let's Build a hashtable called $userHashTable
# Defining variables
$domainName = "mydomain.local"
$password = ConvertTo-SecureString "Password01" -AsPlainText -Force

# Building the hashtable
$userHashTable = @{
GivenName = "Michael"
Surname = "Jordan"
Name = "Michael Jordan"
DisplayName = "Michael Jordan"
Company = "NBA"
Department = "Chicago Bulls"
City = "Chicago"
EmployeeID = 23
UserPrincipalName = "mjordan@$domainName"
SamAccountName = "mjordan"
AccountPassword = $password
Path = $mydomainName2
Enabled = $true
}

New-ADUser @userHashTable -PassThru

# Using the same technique as above, let's create a new AD user (User#2)
# Building the hashtable
$userHashTable = @{
GivenName = "Johnson James"
Surname = "Magic Johnson"
Name = "Magic Johnson James"
DisplayName = "Magic Johnson James"
Company = "NBA"
Department = "Lakers"
City = "LA"
EmployeeID = 32
UserPrincipalName = "mjohnson@$domainName"
SamAccountName = "mjohnson"
AccountPassword = $password
Path = $mydomainName3
Enabled = $true
}

New-ADUser @userHashTable -PassThru


# Using the same technique as above, let's create a new AD user (User#3)
# Building the hashtable
$userHashTable = @{
GivenName = "Lebron"
Surname = "James"
Name = "Lebron James"
DisplayName = "King Lebron James"
Company = "NBA"
Department = "Lakers"
City = "LA"
EmployeeID = 6
UserPrincipalName = "lrjames@$domainName"
SamAccountName = "lrjames"
AccountPassword = $password
Path = $mydomainName1
Enabled = $true
}

New-ADUser @userHashTable -PassThru