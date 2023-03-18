# Writing a simple calculator script

# Define variables
[int32]$number1 = Read-Host("Enter First Number")
[int32]$number2 = Read-Host ("Enter Second Number")

# Performing the Operations
$plusOp = ($number1 + $number2)
$subOp = ($number1 - $number2)
$mulOp = ($number1 * $number2)
$divOp = ($number1 / $number2)
$modOp = ($number1 % $number2)

# Display the result to the User
Write-Host("$number1 + $number2 = $plusOp")
Write-Host("$number1 - $number2 = $subOp")
Write-Host("$number1 * $number2 = $mulOp")
Write-Host("$number1 / $number2 = $divOp")
Write-Host("$number1 % $number2 = $modOp")
