Set-StrictMode -Version Latest
Clear-Host

# Get-ItemProperty .\.gitignore | Get-Member | foreach {"$($_.name), $($_.typename)"}
# Get-ItemProperty .\.gitignore | foreach {$_.GetType()}
# Get-Item .\.gitignore | Get-ItemProperty -Name name | fl

$collection=1, 2, 3, "nope", 1, 2, 3
foreach($currentItemName in $collection){
    if($currentItemName -eq 1){
        'one'
    }
    elseif($currentItemName -eq 2){
        'two'
    }
    elseif($currentItemName -eq 3){
        'three'
    }
    else{
        continue
    }
}

[bool]$aBool = $true
$v = (Get-Variable -Name aBool)
$v | fl
$v.Attributes | fl

