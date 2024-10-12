#
# find cmdlets
#
Get-Command *process*
#
# get help on cmdlet
#
Get-Help Stop-Process
Get-Help Stop-Process -Examples

Get-Process
Get-TimeZone
#
# explore cmdlets
#
Get-Date
Get-Date | Get-Member
get-date | Format-List

Get-Random
Get-Random | Get-Member
#
# get properties of file/dir
#
Get-ItemProperty .\jacked-programmer\README
Get-ItemProperty .\jacked-programmer\README | Format-List
#
# find available modules
#
Find-Module -Tag telegram
Find-Module -Tag telegram | Format-List
Find-Module -Tag telegram | foreach { $_.description }
Find-Module -Tag telegram | foreach { "";$_.description }
Find-Module -Tag telegram | foreach { "";$_.name;"";$_.description }
#
# sort processes by id
#
Get-Process | Sort-Object
Get-Process | Sort-Object id
#
# experiment launching a process and working with process ibj
#
notepad
get-process notepad
Stop-Process notepad
get-help   stop-process
Stop-Process -name notepad
get-process notepad
notepad
get-process notepad
notepad
get-process notepad
Stop-Process -name notepad
get-process notepad
try {get-process notepad} catch {$_.exception.message}
$ErrorActionPreference="STOP"
try {get-process notepad} catch {$_.exception.message}
notepad
Get-Process notepad
Get-Process notepad | stop-process
try {get-process notepad} catch {$_.exception.message}
notepad
try {get-process notepad} catch {$_.exception.message}
Get-Process notepad | stop-process
control.exe
Get-Process control
Get-Process control | Stop-Process
Start-Process notepad
try {get-process notepad} catch {$_.exception.message}
try {get-process notepad | stop-process} catch {$_.exception.message}
hostname
$env:COMPUTERNAME
Invoke-Command -ComputerName $env:COMPUTERNAME -ScriptBlock {Start-Process notepad}        
try {get-process notepad | stop-process} catch {$_.exception.message}
Invoke-Command -ScriptBlock {Start-Process notepad.exe}
#
# filter services list
#
Get-Service
Get-Service *xbox*
Get-Service *parent*
get-help Get-Service
get-help Get-Service -Detailed
Get-Service -DisplayName
Get-Service -DisplayName *parent*
Get-Service
#
#using $psitem or $_
#
$psitem
Get-Service | foreach {$PSItem}
Get-Service | foreach {"";$PSItem}
Get-Service | foreach {"";$PSItem.name}
Get-Service | foreach {"";$PSItem.displayname}
Get-Service | foreach {if($PSItem.description -contains 'parent'){$psitem}}
Get-Service | foreach {if($PSItem.description -contains 'Parent'){$psitem}}
Get-Service | foreach {if($PSItem.description -contains 'a'){$psitem}}
Get-Service | foreach {if($PSItem.description -contains 'xbox' ){$psitem}}
Get-Service | foreach {if($PSItem.description -contains 'xbox' ){$psitem}else{'nope'}  }   
#
# getting about help
#
get-help about_Operators
get-help about_Comparison_Operators
#
# testing comparison operators
#
get-help about_Comparison_Operators
'parental control' -like 'parent'
'parental control' -like '*parent*'
'Parental control' -like '*parent*'
#
# filter services by displayname property using alias foreach
#
Get-Service | foreach {if($PSItem.description -like '*parent*' ){$psitem}}
Get-Service | foreach {if($PSItem.description -like '*xbox*' ){$psitem}}
Get-Service | foreach {if($PSItem.description -like '*xbox*' ){$psitem} else {'.'} }       
Get-Service | foreach {if($PSItem.description -like '*xbox*' ){$psitem} else {"$PSItem.description does not contain"} }
Get-Service | foreach {$psitem}
Get-Service | foreach {$psitem.description}
Get-Service | foreach {$_.description}
Get-Service | foreach {$_.displayname}
Get-Service | foreach {if($PSItem.DisplayName  -like '*xbox*' ){$psitem} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){$psitem} }
Get-Service | foreach {$psitem -eq $_}
#
# filter services by displayname property using foreach-object cmdlet
#
Get-Service | ForEach-Object {$psitem -eq $_}
Get-Service | ForEach-Object {"$_.name - $_.displayname"}
Get-Service | ForEach-Object {"$_"}
Get-Service | ForEach-Object {$_}
Get-Service | ForEach-Object {"$_"}
Get-Service | ForEach-Object {"$($_)"}
Get-Service | ForEach-Object {$"($_)"}
Get-Service | ForEach-Object {"$psitem"}
Get-Service | ForEach-Object {"$psitem.name"}
Get-Service | ForEach-Object { & "$psitem.name"}
Get-Service | ForEach-Object { "$psitem.name"}
Get-Service | ForEach-Object { "$($psitem.name)"}
Get-Service | ForEach-Object { "$($psitem)"}
Get-Service | ForEach-Object { "$($psitem.name) - $($psitem.DisplayName)"}
#
# playing with code block
#
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){$psitem} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$psitem"} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$($psitem)"} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$($psitem.name)"} }     
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){$psitem} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){${psitem}} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){${psitem.name}} }        
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){${psitem}.name} }        
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"${psitem}.name"} }      
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$(psitem).name"} }      
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$(psitem.name)"} }      
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$($psitem).name"} }     
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$($psitem.name)"} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"$(${psitem}.name)"} }   
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"${psitem}.name"} }      
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"${psitem}"} }
Get-Service | foreach {if($PSItem.DisplayName  -like '*parent*' ){"${psitem.name}"} }      
get-process | foreach {$psitem}
get-process | foreach {$psitem.name}
#
# using arrays on the fly
#
"a","b"
1,2,3
1,2,3 | foreach {$psitem * 2}
#
# exploring datetime obj
#
get-date | ft
date | ft
date | Get-Member
date | foreach {$_}
date | foreach {$_.DayOfWeek}
(date)
(date).dayofweek
date | fl
alias
gh
#
# where or where-object
#
help Where-Object
help Where-Object -Examples
alias
alias | more
help Where-Object -Examples
alias | wo
alias | Where-Object {$_.name -like '*where*'}
#
# select or select-object
#
date | fl *
date | fl
date | select
date | select name
date | select year
#
# working with history file
#
history
Get-History
(Get-PSReadlineOption).HistorySavePath
cat (Get-PSReadlineOption).HistorySavePath
#
# run all scripts in subfolder
#
Get-ChildItem .\jacked-programmer\*.ps1 | foreach { & $_.fullname }
.\jacked-programmer\loops.ps1
get-help about_Logical_Operators
Get-ChildItem .\jacked-programmer\*.ps1 | foreach {$_}
Get-ChildItem .\jacked-programmer\*.ps1 | foreach {$_.name}
Get-ChildItem .\jacked-programmer\*.ps1 | foreach { if  (!($_.name -like 'measure*')) { & $_.fullname} }

