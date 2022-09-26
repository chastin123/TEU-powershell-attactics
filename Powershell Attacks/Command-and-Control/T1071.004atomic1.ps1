# By Threats Experts University
# Technique: T1071.004 - DNS
# Task: DNS Large Query Volume

for($i=0; $i -le 1000; $i++) { Resolve-DnsName -type "TXT" "atomicredteam.$(Get-Random -Minimum 1 -Maximum 999999).127.0.0.1.xip.io" -QuickTimeout}