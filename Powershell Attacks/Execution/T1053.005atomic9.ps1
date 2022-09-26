# By Threats Experts University
# Technique: T1053.005 - Scheduled Task
# Task: PowerShell Modify A Scheduled Task
# Requirement/s:

$Action = New-ScheduledTaskAction -Execute "cmd.exe"
$Trigger = New-ScheduledTaskTrigger -AtLogon
$User = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$Set = New-ScheduledTaskSettingsSet
$object = New-ScheduledTask -Action $Action -Principal $User -Trigger $Trigger -Settings $Set
Register-ScheduledTask AtomicTaskModifed -InputObject $object
$NewAction = New-ScheduledTaskAction -Execute "Notepad.exe"
Set-ScheduledTask "AtomicTaskModifed" -Action $NewAction