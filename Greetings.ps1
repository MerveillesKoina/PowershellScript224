#Writing a script that will ask for user input and display a greeting output.

#Declaring variables
$firstName = Read-Host ("Please Enter your FirstName")
$lastName = Read-Host ("Enter your lastName")
$salutation = Read-Host ("How would you like to be greeted(Mr., Ms, Dr. etc)")

# Display the result to the user
Write-Host("Greetings $salutation $firstName $lastName")