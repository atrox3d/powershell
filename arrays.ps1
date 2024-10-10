Write-Output "Set-StrictMode -Version Latest"
Set-StrictMode -Version Latest

$Names=@('bob',  'steve', 'john')   # create array
Write-Output "";$Names.GetType()    # check type 
Write-Output "";$Names.IsFixedSize  # check IsFixedSize property
Write-Output "";$Names              # output array
Write-Output "";$Names[1]           # output 2nd element

$Names = $Names + 'Paul'            # add element Paul
Write-Output "";$Names              # output array

$Names += 'Tim'                     # add element Tim
Write-Output "";$Names              # output array

$Names = $Names -ne 'John'          # remove John
Write-Output "";$Names
