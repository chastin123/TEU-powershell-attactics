# By Threats Experts University
# Technique: T1047 - Windows Management Instrumentation
# Task: Create a Process using obfuscated Win32_Process
# Requirement/s:

$Class = New-Object Management.ManagementClass(New-Object Management.ManagementPath("Win32_Process"))
$NewClass = $Class.Derive("Win32_Atomic")
$NewClass.Put()
Invoke-WmiMethod -Path Win32_Atomic -Name create -ArgumentList notepad.exe