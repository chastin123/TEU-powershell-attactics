# By Threats Experts University
# Technique: T1047 - Windows Management Instrumentation
# Task: WMI Execute rundll32
# Requirement/s: calc.dll file from https://github.com/redcanaryco/atomic-red-team/tree/master/atomics/T1047/bin
# Note: See instructions from https://github.com/Mica56/powershell-attacks for downloading files using powershell

wmic /node:127.0.0.1 process call create "rundll32.exe C:\temp\calc.dll StartW"



