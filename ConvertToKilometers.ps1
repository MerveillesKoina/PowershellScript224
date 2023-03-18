
<#
.Synopsis
    Convert miles to kilometers
.Description
    This function converts "Miles" to "Kilometers"
#>

# Let's define the function
function Convert-MilesToKilometers
{

    param(
        [Parameter(Mandatory)]
        [double] $Miles
    )

    $kilometer = ($Miles * 1.61)
    Write-Output ""
    Write-Output "$Miles mile(s) equals $kilometer KM(s)"
}

Convert-MilesToKilometers -Miles 10

Convert-MilesToKilometers -Miles 5