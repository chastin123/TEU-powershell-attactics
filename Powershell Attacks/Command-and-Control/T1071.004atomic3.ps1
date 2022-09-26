# By Threats Experts University
# Technique: T1071.004 - DNS
# Task: DNS Long Domain Query
# Requirement/s: needs T1071-dns-domain-length.ps1, put this file on C:\temp folder or change the Set-Location.

Set-Location C:\temp\
.\T1071-dns-domain-length.ps1 -Domain 127.0.0.1.xip.io -Subdomain atomicredteamatomicredteamatomicredteamatomicredteamatomicredte -QueryType TXT