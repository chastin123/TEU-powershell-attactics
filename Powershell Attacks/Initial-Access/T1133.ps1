# By Threats Experts University
# T1133 - External Remote Services
# Task: Running Chrome VPN Extensions via the Registry 2 vpn extension
# Requirement/s: Chrome must be installed

$extList = "fdcgdnkidjaadafnichfpabhfomcebme"
foreach ($extension in $extList) {
  New-Item -Path HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension -Force
  New-ItemProperty -Path "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx" -PropertyType "String" -Force}
Start chrome
Start-Sleep -Seconds 30
Stop-Process -Name "chrome"

