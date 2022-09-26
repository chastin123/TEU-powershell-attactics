# By Threats Experts University
# Technique: T1071.004 - DNS
# Task: DNS Regular Beaconing
# Requirement/s: needs T1071-dns-beacon.ps1, put this file on C:\temp folder or change the Set-Location.

Set-Location C:\temp\
.\T1071-dns-beacon.ps1 -Domain 127.0.0.1.xip.io -Subdomain atomicredteam -QueryType TXT -C2Interval 30 -C2Jitter 20 -RunTime 30