Set-StrictMode -Version Latest



<#
.SYNOPSIS
    returns weatherreport information
.DESCRIPTION
    console oriented weather forecast that returns weather information for specified parameters
.EXAMPLE
    Get-Weather

    returns full weather information on the location of your IP address with all defaults
.EXAMPLE
    Get-Weather -Short

    returns returns basic information based on the location of your IP
.EXAMPLE
    Get-Weather -City 'London' -Units Metric -Language 'en'

    returns full weather information for the city of London in Metric units with UK language
.PARAMETER City
    the city to get the weather for, defaults to IP location
.PARAMETER Units
    diplay units Metric vs USCS
.PARAMETER Language
    display language
.PARAMETER Short
    returns only basic info
.NOTES
    https://github.com/chubin/wttr.in
    https://wttr.in/:help
#>
function Get-Weather {
    [CmdletBinding()]
    param (
        [Parameter( Position  = 0, Mandatory = $false )]
        [string]
        $City,

        [Parameter(Position  = 1)]
        [ValidateSet('metric', 'uscs')]
        [string]
        $Units = 'uscs',

        [Parameter(Position = 2)]
        [ValidateSet('am', 'ar', 'af', 'be', 'bn', 'ca', 'da', 'de', 'el', 'et', 'fr', 'fa', 'gl', 'hi', 'hu', 'ia', 'id', 'it', 'lt', 'mg', 'nb', 'nl', 'oc', 'pl', 'pt-br', 'ro', 'ru', 'ta', 'tr', 'th', 'uk', 'vi', 'zh-cn', 'zh-tw')]
        [string]
        $Language = "en",

        [Parameter(Position = 3)]
        [switch]
        $Short
    )

    # dump params with values
    $PSBoundParameters.foreach({
        foreach($param in $_.GetEnumerator()) {
            Write-Verbose "$($param.Key) = $($param.Value)"
        }
    })
    
    Write-Output ""
    
    # dump params with values
    foreach($bound in $PSBoundParameters.GetEnumerator()) {
        "Key={0} Value={1}" -f $bound.Key,$bound.Value | Write-Verbose
    }

    if($PSBoundParameters.ContainsKey('City')){
        Write-Verbose "City = $City"
    }

    $uriString = 'https://wttr.in/'

    if($City) {
        $uriString += "$City"
    }

    switch ($Units) {
        'metric' { $uriString += "?m" }
        'uscs' { $uriString += "?u" }
    }

    if($Short) { $uriString += "&format=4"}

    $uriString += "&lang=$Language"
    Write-Verbose "uriString = $uriString"

    $invokeSplat = @{
        Uri             = $uriString
        ErrorAction     = 'Stop'
    }

    try {
        Invoke-RestMethod @invokeSplat
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Error $_
    }
}

Clear-Host
Get-Weather -Units 'USCS' -City 'Turin' -Short -Language it -Verbose