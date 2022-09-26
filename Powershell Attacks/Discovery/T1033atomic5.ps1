# By Threats Experts University
# Technique: T1033 - System Owner/User Discovery
# Task: GetCurrent User with PowerShell Script

[System.Security.Principal.WindowsIdentity]::GetCurrent() | Out-File -FilePath .\CurrentUserObject.txt