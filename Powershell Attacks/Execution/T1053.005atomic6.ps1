# By Threats Experts University
# Technique: T1053.005 - Scheduled Task
# Task: WMI Invoke-CimMethod Scheduled Task
# Requirement/s:

$xml = [System.IO.File]::ReadAllText("C:\temp\WMI.xml")
Invoke-CimMethod -ClassName PS_ScheduledTask -NameSpace "Root\Microsoft\Windows\TaskScheduler" -MethodName "RegisterByXml" -Arguments @{ Force = $true; Xml =$xml; }