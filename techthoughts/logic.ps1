Set-StrictMode -Version Latest
Clear-Host

$path = 'c:\test'
$evalPath = Test-Path $path
if ($evalPath -eq $true) {
    Write-Output "$path VERIFIED"
}
elseif ($evalPath -eq $false) {
    Write-Output "$path NOT VERIFIED"
}

##################################################

foreach($value in 1, 2, 3, 4, 5) {
    switch($value) {
        1 {Write-Output "ONE"}
        default {"i dont know $value"}
    }
}

##################################################

for($i=0;$i -le 15;$i++) {
    Write-Host "this is color $i" -ForegroundColor $i
}
