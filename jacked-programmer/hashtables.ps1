Write-Output "Set-StrictMode -Version Latest"
Set-StrictMode -Version Latest

$Users = @{                         # create hashtable
    johns='John Smith'
    bobt='bob test'
    stevep='steve pickle'
}

Write-Output "";$Users              # print hashtable
# $Users.GetType()

Write-Output "";$Users.Keys         # print hashtable keys
Write-Output "";$Users.Values       # print hashtable values

Write-Output "";$Users.johns        # reference key dot notation
Write-Output "";$Users['johns']     # reference key dict style

$Users.Add('fab', 'fab the cat')    # add user with method
Write-Output "";$Users
Write-Output "";$Users.fab

$Users['x'] = 'userx'               # add user with dict style
Write-Output "";$Users.x

$Users.y = 'usery'                  # add user with dot notation
Write-Output "";$Users
Write-Output "";$Users.y

Write-Output "non existing user:";$Users['dontexist']
Write-Output "";$Users.ContainsKey('dontexist')
Write-Output "";$Users.Contains('dontexist')


