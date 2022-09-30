

Set-Location C:\temp\
.\T1071-dns-domain-length.ps1 -Domain 127.0.0.1.xip.io -Subdomain atomicredteamatomicredteamatomicredteamatomicredteamatomicredte -QueryType TXT

Write-Output ""



$userhandle = Read-Host -Prompt " [Username]:"



$myArray = @(

"https://twitter.com/$userhandle",

"https://www.instagram.com/$userhandle/",

"https://ws2.kik.com/user/$userhandle/",

"https://medium.com/@$userhandle",

"https://pastebin.com/u/$userhandle/",

"https://www.patreon.com/$userhandle/",

"https://photobucket.com/user/$userhandle/library",

"https://www.pinterest.com/$userhandle/",

"https://myspace.com/$userhandle/",

"https://www.reddit.com/user/$userhandle/"



)



Write-Output ""



Write-Host " [*] Running Checks ..."



Write-Output ""



foreach ($i in $myArray) {



try {



$response = Invoke-WebRequest -Uri "$i" -UseBasicParsing -ErrorAction Stop

$StatusCode = $Response.StatusCode



} catch {



$StatusCode = $_.Exception.Response.StatusCode.value__



}





if ($StatusCode -eq "200"){



Write-Host "Found one: " -NoNewline ; Write-Host $i -ForegroundColor Green



}



if ($StatusCode -eq "404"){



#Site Does Not Exist - Do Nothing



}



else {



#Do Nothing



}



}



Write-Output ""

