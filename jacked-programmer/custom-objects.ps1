Write-Output "Set-StrictMode -Version Latest"
Set-StrictMode -Version Latest

$Dog =  New-Object -TypeName PSCustomObject
$Dog
$Dog.GetType()

Add-Member -InputObject $Dog -MemberType NoteProperty -Name 'Name' -Value 'Penny'
Add-Member -InputObject $Dog -MemberType NoteProperty -Name 'Breed' -Value 'Pug'
$Dog
$Dog.GetType()

$Dog.Name
$Dog.Breed

Get-Member -InputObject $Dog
Get-Member -InputObject $Dog -View Extended | Select-Object Name, Definition

$Cat = [PSCustomObject]@{Name = 'Fab';Breed='European'}
$Cat
