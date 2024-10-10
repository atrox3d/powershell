Write-Output "Set-StrictMode -Version Latest"
Set-StrictMode -Version Latest


$NameList = [System.Collections.ArrayList]@('bob', 'john', 'tim')
Write-Output "";$NameList.GetType()    # check type 
Write-Output "";$NameList.IsFixedSize  # check IsFixedSize property
Write-Output "";$NameList              # output array
Write-Output "";$NameList[1]           # output 2nd element

$NameList.Add('mike')                  # add element, outputs index
Write-Output "";$NameList              # output array
Write-Output "";$NameList[-1]          # output last element

$null =  $NameList.Add('steve')        # add element, suppress output
Write-Output "";$NameList              # output array
Write-Output "";$NameList[-1]          # output last element

$NameList.Remove('tim')                # remove element
Write-Output "";$NameList              # output array

$NameList.RemoveAt(0)                  # remove bob
Write-Output "";$NameList              # output array
