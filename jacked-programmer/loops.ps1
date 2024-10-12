Set-StrictMode -Version Latest
Clear-Host

"FOR LOOPS"
""
for($i=0;$i -lt 10;$i++){
    $i
}

$filepath = 'names.txt'
$names = Get-Content -Path $filepath
""
for($i=0;$i -lt $names.Length;$i++){
    $names[$i]
    Get-Content -Path "names\$($names[$i])\config.txt"
}

""
"WHILE LOOP"
Get-Date -Format hh:mm
# $minutes = (Get-Date).Minute
$now = Get-date
$now.GetType()
$now.ToString('hh:mm:ss')
$next = $now.AddSeconds(10)
# $next.ToString('hh:mm')
"waiting for $($next.ToString('hh:mm:ss'))"
while((Get-Date).Second -lt $next.Second){
    ;
}
""
"DO WHILE LOOP"
do {
    "do hello while"
} while($false)

""
"DO UNTIL LOOP"
do {
    "do hello until"
} until($true)

