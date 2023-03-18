# Using function, write a script to print grade of student.

Function Calculate-Grade
{
    param(
        [Parameter(Mandatory)]
        [String] $Name,
        [Parameter(Mandatory)]
        [double]$Points
    )

    if($Points -ge 90)
    {
        $grade = "A"
    }
    elseif ($Points -ge 80)
    {
        $grade = "B"
    }
    elseif ($Points -ge 70)
    {
        $grade = "C"
    }
    else
    {
        $grade = "F"
    }
    
    "$Name's grade is $grade"
}

Calculate-Grade -Name MerveilleKoina -Points 92

Calculate-Grade -Name Nelly -Points 74

Calculate-Grade -Name Selena -Points 55