<#
Program: .NET 4 Framework Installed Checker 
Description: Checks if .NET 4.5 Framework or higher is installed on a local machine 
Author: Austin Way
Date: 6/25/2020
#>

$dotnetreleasenumbers = 
378389, 
378675, 
378758, 
379893, 
393295, 
393297, 
394254, 
394271, 
394802, 
394806, 
460798, 
460805, 
461308, 
461310, 
461808, 
461814, 
528040, 
528049

$dotnetframeworkversion = 
".NET Framework 4.5", 
".NET Framework 4.5.1", 
".NET Framework 4.5.1", 
".NET Framework 4.5.2", 
".NET Framework 4.6", 
".NET Framework 4.6", 
".NET Framework 4.6.1", 
".NET Framework 4.6.1", 
".NET Framework 4.6.2", 
".NET Framework 4.6.2", 
".NET Framework 4.7", 
".NET Framework 4.7", 
".NET Framework 4.7.1", 
".NET Framework 4.7.1", 
".NET Framework 4.7.2", 
".NET Framework 4.7.2", 
".NET Framework 4.8", 
".NET Framework 4.8"

$counter = 0
foreach ($item in $dotnetreleasenumbers)
{
    $index = $dotnetreleasenumbers.IndexOf($item) # returns 0 - 17 
    $check = (Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release -ge $dotnetreleasenumbers[$index] # returns true or false
    
    if($check -eq "True") {
        Write-Host -foregroundcolor "green" $dotnetframeworkversion[$index] "release" $dotnetreleasenumbers[$index] "is installed"
    } else {
        Write-Host -foregroundcolor "red" $dotnetframeworkversion[$index] "release" $dotnetreleasenumbers[$index] "is NOT installed"
    }

    $counter = $counter + 1
}

Pause


