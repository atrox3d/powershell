param(
    # Parameter help description
    [Parameter()]
    [string]
    $Name
)

if($Name){
    Write-Output "name is $Name"
}else{
    Write-Output "no name"
}

<#
.SYNOPSIS
    A short one-line action-based description, e.g. 'Tests if a function is valid'
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>
function Get-IP {
    param(
        # Parameter help description
        [Parameter()]
        [string]
        $Name
    )
    return "ip $Name"
}

Get-Help Get-IP
Get-IP $Name
