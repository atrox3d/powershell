Set-StrictMode -Version Latest

$Service = 'Spooler'

Get-Service -Name $Service                          # get service obj

Stop-Service $Service                               # stop the service
Get-Service -Name $Service                          # show the service obj

Start-Service $Service                              # start the service
Get-Service -Name $Service                          # show the service obj

Get-Service -Name $Service | Stop-Service           # stop the service via pipe
Get-Service -Name $Service                          # show the service obj

Get-Service -Name $Service | Start-Service          # start the service via pipe
Get-Service -Name $Service                          # show the service obj

$ServiceObj = Get-Service -Name $Service            # assign service obj  to variable
$ServiceObj.Status                                  # get Status property of service

#####################################################################################
$Services = [System.Collections.ArrayList]@(        # create arraylist of service names
'Spooler',
'W32Time'
)

$Services | Get-Service | Start-Service             # start all services in array
$Services | Get-Service                             # display all services in array

$Services[1] | Get-Service | Stop-Service           # stop all services in array
$Services | Get-Service                             # display all services in array

#####################################################################################
# backtick ` = option + 9 + space
$ServiceObj = New-Object -TypeName PSCustomObject   # create custom  obj

Add-Member  -InputObject $ServiceObj `              # add Name property
-MemberType NoteProperty `
-Name 'Name' `
-Value 'Spooler'

#####################################################################################
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-5.1
$param_splatting = @{                               # create hashtable for splatting
    InputObject=$ServiceObj
    MemberType="NoteProperty"
    Name='ComputerName'
    Value=$env:COMPUTERNAME
}
Add-Member @param_splatting                         # add ComputerName property

$ServiceObj                                         # print obj
$ServiceObj | Get-Service                           # pipe obj to get-service






