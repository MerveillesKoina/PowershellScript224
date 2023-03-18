# Write a script 
# The script should prompt the user to enter a whole number.

# Defining a variable called userPin

[int]$userPin = Read-Host ("Please Enter a whole number")

# Using the if else statement, check if the entered number is positive or negative
if ($userPin -gt 0){
    Write-host ("Positive")
}
if ($userPin -lt 0 )
{
      Write-Warning ("Negative")
}

if ($userPin -notmatch '^\d{4}$')
{
    Write-Warning ("Error, Please Try Again The Entered User Pin is less than 4 digits")
}
