Set-StrictMode -Version Latest
Clear-Host

function Simple-Function {
    param($Name='name') 
    Write-Output "creating config $Name"
}

function Advanced-Parameters {
    param(
        [Parameter()]
        [ValidateSet(1, 2)]
        [String] $p1='None'
    )
    Write-Output "p1=$p1"
}

Simple-Function
Simple-Function x
Simple-Function -Name y

try
{
    Advanced-Parameters
    Advanced-Parameters 1
    Advanced-Parameters "1"
    Advanced-Parameters 3
    Advanced-Parameters 2
} catch {
    $_.exception.message
}

Get-Help Simple-Function
Get-Help Advanced-Parameters


