Set-StrictMode -Version Latest

1 -eq 1
1 -ne 2
1 -gt 0
1 -ge 1
0 -lt 1
0 -le 1

@(1, 2, 3) -contains 1

'Powershell' -like 'powershell'
'Powershell' -like 'power*'

$filepath = '.\names--.txt'
Test-Path -Path $filepath

$filepath = '.\names.txt'
Test-Path -Path $filepath

if (Test-Path -Path $filepath) {
    Write-Output "does this run?"
}

$filepath = '.\nonames.txt'
if (Test-Path -Path $filepath) {
    Get-Content -Path $filepath
} else {
    Write-Output 'the file $filepath does not exist'
    Write-Output "the file $filepath does not exist"
}

$filepath = '.\names.txt'
if (Test-Path -Path $filepath) {
    $data = Get-Content -Path $filepath
    if ($data.Count -lt 5) {
        Write-Output 'the file has less than 5 names'
    }
    elseif ($data.Count -lt 10) {
        Write-Output 'the file has less than 10 names'
    } else {
        Write-Output 'the file has 10 or more names'
    }
    Write-Output 'after if elseif else block'
} else {
    Write-Output "the file $filepath does not exist"
}



