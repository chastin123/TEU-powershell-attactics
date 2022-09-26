# By Threats Experts University
# Technique: T1053.005 - Scheduled Task
# Task: - Import XML Schedule Task with Hidden Attribute
# Requirement/s:

$xml = [System.IO.File]::ReadAllText("C:\temp\SCTHIDDENATTRIB.xml")
Invoke-CimMethod -ClassName PS_ScheduledTask -NameSpace "Root\Microsoft\Windows\TaskScheduler" -MethodName "RegisterByXml" -Arguments @{ Force = $true; Xml =$xml; }