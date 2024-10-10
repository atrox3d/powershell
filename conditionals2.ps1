Set-StrictMode -Version Latest

$filepath = ".\names.txt"
if (Test-Path -Path $filepath){
    $data = Get-Content $filepath

    $first = $data[0]
    switch ($first) {
        'Bobs' { 'Bob is here' }            # not executed
        'Mark' { 'Mark is here' }           # not executed
        default { 'No one' }                # --> executed
    }
    
    $count = $data.Count                    # 5
    Write-Output "total names: $count"
    switch($count){
        {0..4 -contains $count} {           # not executed
            Write-Output 'between 0 and 4'
        }
        {3..7 -contains $count} {           # --> executed
            Write-Output 'between 3 and 7'
        }
        {5..10 -contains $count} {          # --> executed
            Write-Output 'between 5 and 10'
        }
        default {
            Write-Output 'more than 10'     # not executed
        }
    }
    switch($count){
        {0..4 -contains $count} {           # not executed
            Write-Output 'between 0 and 4'
            break
        }
        {3..7 -contains $count} {           # --> executed
            Write-Output 'between 3 and 7'
            break
        }
        {5..10 -contains $count} {          # --> NOT executed
            Write-Output 'between 5 and 10'
        }
        default {
            Write-Output 'more than 10'     # not executed
        }
    }
} else {
    Write-Output "the file $filepath does not exist"
}
