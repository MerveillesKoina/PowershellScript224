# Writing a simple calculator Script
# Define variables
[int32]$number1 =  Read-Host("Please Enter your First Number:")
[int32]$number2 = Read-Host("Please Enter your Second Number:")

[int32]$plusOp = ($number1 + $number2)
[int32]$minusOp = ($number1 - $number2)
[int32]$multOp = ($number1 * $number2)
[int32]$divOp = ($number1 / $number2)
[int32]$modOp = ($number1 % $number2)

# Let's use a Switch statement
switch($operators)
{
    + 
    {
        Write-Host("The result of $number1 plus $number2 is $plusOp")
    }
    -
    {
        Write-Host("The result of $number1 minus $number2 is $minusOp")
    }
    *
    {
        Write-Host("The result of $number1 times $number2 is $multOp")
    }
    /
    {
        Write-Host("The result of $number1 divided by $number2 is $divOp")
    }
    %
    {
        Write-Host("The result of $number1 modulo $number2 is $modOp")
    }
}
