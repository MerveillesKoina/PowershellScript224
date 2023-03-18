# For this task we are going to make use of an imported csv file to create new adUsers.

# Importing the csv file
$build = Import-Csv "C:\scripts\WealthBuilder.csv" -Delimiter ";"

# Defining a variable called mydomainName that point to the root domain
$mydomainName = "DC=mydomain, DC=local"

# Creating Brotherhood OU under the root
$fam= New-ADOrganizationalUnit -Name "Brotherhood" -Path "$mydomainName" -PassThru

$mypath = "OU=Brotherhood,DC=mydomain,DC=local"

# Using the foreach 
foreach ($myusers in $build)
{
    $firstname = $myusers.FirstName
    $lastname = $myusers.LastName
    $brand = $myusers.Brand
    $sneakerhead = $myusers.Sneakers
    $job = $myusers.Occupation
    $username = "$firstname $lastname"
    New-ADUser -Name $username -Path $mypath
    Write-Host "$username favorite car is $brand.He/She only rocks $sneakerhead and works as a $job ` " 
   
}
