Set-StrictMode -Version Latest
Clear-Host

$env:PSModulePath.Split(';')

""
Get-Module

""
Get-Module -ListAvailable

Import-Module -Name WindowsUpdate
Get-Command -ListImported -Module WindowsUpdate
Get-WindowsUpdateLog
Remove-Module -Name WindowsUpdate
