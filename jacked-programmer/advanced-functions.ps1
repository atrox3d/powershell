Set-StrictMode -Version Latest
Clear-Host

function Simple-Cmdlet {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [String] $Name='None'
    )
    begin {
        Write-Output "begin: Name=$Name"
    }
    process {
        Write-Output "process: Name=$Name"
    }
    end {
        Write-Output "end: Name=$Name"
    }
}

Simple-Cmdlet

@(1, 2,  3,  4, 5) | Simple-Cmdlet

Get-Help Simple-Cmdlet


