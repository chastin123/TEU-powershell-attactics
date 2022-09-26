# By Threats Experts University
# Technique: T1021.006 - Windows Remote Management
# Task: Remote Code Execution with PS Credentials Using Invoke-Command

$SecPassword = ConvertTo-SecureString "N0virus1" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("$env:USERNAME", $SecPassword)
Invoke-Command -ComputerName "$env:COMPUTERNAME" -Credential $Cred -ScriptBlock {whoami}