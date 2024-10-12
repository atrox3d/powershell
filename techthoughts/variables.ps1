# use f8 on each line

Get-Process

$processes = Get-Process
$processes

#----------------------------------------------------------------
# not using variable
Get-Process | Where-Object {$_.CPU -gt 1000}
Get-Process | Sort-Object WorkingSet64 -Descending
#----------------------------------------------------------------
# using variable
$processes = Get-Process
$processes | Where-Object {$_.CPU -gt 1000}
$processes | Sort-Object WorkingSet64 -Descending

#----------------------------------------------------------------
$total = 2 + 2
$total
$total.GetType()

#----------------------------------------------------------------
$total = '2 + 2'
$total
$total.GetType()

#----------------------------------------------------------------
$num1 =  2
$num2 = 2
$total = $num1 + $num2
$total
$total.GetType()

#----------------------------------------------------------------
[int]$num1 = '2'                    # [int] has precedence over '2'
$num1.GetType()                     # type ins Int32
[int]$num2 = '2'                    # [int] has precedence over '2'
$num2.GetType()                     # type ins Int32
$itotal = $num1 + $num2             
$itotal
$itotal.GetType()                   # type is Int32
$stotal = $itotal.ToString()
$total
$stotal.GetType()
[string]$total = $num1 + $num2      # [string] has precedence
$total
$total.GetType()                    # type is String

#-----------------------------------------------------------------
$literal = '2 + 1 = $(2 + 1)'
$literal
$escaped = "2 + 1 = $(2 + 1)"
$escaped

#-----------------------------------------------------------------
Get-Variable
dir variable:
Get-Variable | foreach {$_} | fl

dir env:

#-----------------------------------------------------------------
# putting all together
$path = Read-Host -Prompt 'path to scan for large files:'
$allFiles = Get-ChildItem -Path $path -Recurse
$largerFiles = $allFiles | Where-Object {$_.Length -gt 100mb}
$count = $largerFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Output "you have $count large files"