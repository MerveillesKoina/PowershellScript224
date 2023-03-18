# Importing the StudentInfo file 
$data = Import-Csv C:\scripts\StudentInfo.Csv

# Displaying the Content of StudentInfo file
Write-Output($data)

# Selecting Specific Object to display
$data | Select-Object LastName, ID , Class

#Selecting Specific Object to display
$data | Select-Object ID, LastName, FirstName, Class

#Sorting by First Name
$data | Sort-Object FirstName

# Sorting by Last Name
$data | Sort-Object LastName

# Sorting by class
$data | Sort-Object Class

# Using "where" to display only student in the IT224
$data | Where-Object {$_.Class -eq "IT224"}

# Using "where" to display only student in the IT340
$data | Where-Object {$_.Class -eq "IT340"}

# Using the where-object to display only students whose last name starts with letter "C"
$data | Where-Object {$_.LastName -like "C*"}

#Displaying students whose IDs are between 1100 and 3000
$data | Where-Object {($_.ID -ge 1100) -and($_.ID -le 3000)}

# Display students data in the format "Lastname, Firstname"
$data | foreach{
    $firstName = $_.FirstName
    $lastName = $_.LastName
    Write-Host "Official Name: $lastName, $firstName"
}

# Create email accounts that look like this
# LastName_ID@mail.greenriver.edu

$data | foreach {
    #Build the student name string
    $lastName = $_.LastName
    $studentID = $_.ID
    $studentUsername = "$lastName $studentID"

    $underscore = "_"
    $emailSuffix = "@email.greenriver.edu"

    # Building the email string
    $myEmail = "$lastName" + $underscore + $studentID + $emailSuffix
    

    # Display the output
    Write-Host "$studentUsername's email is: $myEmail"
}