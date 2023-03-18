# Writing a script to explore the cmdlet Get-Random

#Using the ForEach-Object

100..1500 | ForEach-Object{
    1..8 | Get-Random
} | Group-Object | Select-Object Name, Count
