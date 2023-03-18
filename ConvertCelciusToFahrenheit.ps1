<#
.Synopsis
    Convert Celcuis temperature to Fahrenheit units
.Description
    This function converts a "Celcius" temperature to "Fahrenheit"
.Example
    Convert-CelciusToFahrenheit -Celcius -40.3
#>

# Let's define the function
function Convert-CelciusToFahrenheit
{

    param(
        [Parameter(Mandatory)]
        [double] $Celcius
    )

    $fahrenheit = ($Celcius * 9/5) + 32
    Write-Output ""
    Write-Output "$Celcius C = $fahrenheit F"
}

Convert-CelciusToFahrenheit -Celcius 100

Convert-CelciusToFahrenheit -Celcius 36.4

Convert-CelciusToFahrenheit -Celcius -40.0