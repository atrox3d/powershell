Set-StrictMode -Version Latest

$filepath = ".\names.txt"
$names = Get-Content $filepath

$current=$names[0]
Get-Content -Path "names\$current\config.txt"

"METHOD 1 | name by name:"
""
Get-Content -Path "names\$($names[0])\config.txt"
Get-Content -Path "names\$($names[1])\config.txt"
Get-Content -Path "names\$($names[2])\config.txt"
Get-Content -Path "names\$($names[3])\config.txt"
Get-Content -Path "names\$($names[4])\config.txt"

""
'METHOD 2 | for each ($name in $names):'
""
foreach($name in $names){
    Get-Content -Path "names\$name\config.txt"
}

""
'METHOD 3 | $names | ForEach-Object -Process:'
""
$names | ForEach-Object -Process {
    Get-Content -Path "names\$_\config.txt"         # $_ = current obj from pipe
}
""
'METHOD 4 | $names.ForEach({Get-Content -Path "names\$_\config.txt"}):'
""
$names.ForEach({
    Get-Content -Path "names\$_\config.txt"
})
