#https://youtu.be/ljnhoFkFJ8g?t=517

write-host "which event log?"
Get-EventLog -list | Select-Object log

$log = read-host

$log
