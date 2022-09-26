# By Threats Experts University
# Technique: T1033 - System Owner/User Discovery
# Task: User Discovery With Env Vars PowerShell Script

[System.Environment]::UserName | Out-File -FilePath .\CurrentactiveUser.txt 
$env:UserName | Out-File -FilePath .\CurrentactiveUser.txt -Append