Set-StrictMode -Version Latest
Clear-Host


Remove-Item Function:Get-PublicIP -ErrorAction SilentlyContinue

<#
.SYNOPSIS
    returns your ip public address
.DESCRIPTION
    queries the ipify public api and returns yout public ip
.LINK
    -
.EXAMPLE
    Get-PublicIP
.OUTPUTS
    System.String
.NOTES
    https://github.com/rdegges/ipify-api
#>
function Get-PublicIP {
    [CmdletBinding()]
    param (
    )

    $URI = 'https://api.ipify.org'
    Write-Verbose "Pulling public IP from $URI"
    try {
        $InvokeRestMethodSplat = @{
            Uri         = $URI
            ErrorAction = 'Stop'
        }
        $publicIP = Invoke-WebRequest @InvokeRestMethodSplat
    }
    catch {
        Write-Error $_
    }
    return $publicIP.Content
}
# Get-PublicIP

