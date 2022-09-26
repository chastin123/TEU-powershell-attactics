# By Threats Experts University

 $user = whoami
    $currenthost = hostname 
    $networkinfo = (Get-NetIPAddress).IPAddress
    $Publicip = (Invoke-WebRequest http://ipinfo.io/ip).content
    $org = (Get-CimInstance Win32_OperatingSystem).Organization


    Write-Output ""

    Write-Host " User: $user"
    Write-Host " Hostname: $currenthost"
    Write-Host " Public IP: " -NoNewline; Write-Host $Publicip
    write-host " Organization: $org"


    Write-Output ""

    Write-Host " [*] Getting AntiVirus ... "
    Start-Sleep -Seconds 2

     try {
    
        Get-CimInstance -Namespace root/securitycenter2 -ClassName antivirusproduct | Select-Object displayName | Format-Table -HideTableHeaders
    
        } catch{
        
        write-host "Failed To Get AntiVirus" -ForegroundColor Red

                }

    Write-Output ""

    Write-Host " [*] Getting Network IP/s ..."
    Start-Sleep -Seconds 2
   
    Write-Output ""

    $networkinfo

    Write-Output ""

     $lad = @(Get-CimInstance win32_useraccount | Select-Object name,sid)

        foreach ($l in $lad){
        
          [string]$sid = $l.sid

            if ($sid.EndsWith("500")){

            $ladstatus = (Get-CimInstance win32_useraccount | Where-Object {$_.name -like $l.name}).Disabled 

            if ($ladstatus -eq "True"){
                
                $c = "Red"
            
                } else {

                    $c = "Green"
                
                     }
            
            Write-Host " [*] Getting Local Admin ..."
            Start-Sleep -Seconds 2

            Write-Host " Local Admin Found: " -NoNewline ; Write-Host $l.name -ForegroundColor Green -NoNewline ; Write-Host " | isDisabled: " -NoNewline ; Write-Host $ladstatus -ForegroundColor $c           
            
            
          }
      
        }

         Write-Output ""

        Write-Host " [*] Getting Current Logged In Users ... "
        Start-Sleep -Seconds 2

        Write-Output ""

            query user /server:$SERVER 

        Write-Output ""

        Write-Host " [*] Getting Program Directories ... "
        Start-Sleep -Seconds 2

        $allprogs = @()
        $progs = @((get-childitem "c:\program files").Name)
        $progs32 = @((get-childitem "c:\Program Files (x86)").Name)
        $allprogs += $progs ; $allprogs += $progs32

         Write-Output ""

            foreach ($pn in $allprogs){
            
                if ($pn -notlike "*Windows*" -and $pn -notlike "*Microsoft*"){
                    
                    Write-Host $pn -ForegroundColor Green
                
                    } else {
                            
                            Write-Host $pn

                            }

            
                }

            

        Write-Output ""

        Write-Host " [*] Getting SMB Shares ... "
        Start-Sleep -Seconds 2

         Write-Output ""

            Get-SmbShare | Format-Table -HideTableHeaders

        Write-Output ""

        Write-Host " [*] Getting " -NoNewline ; Write-Host "Blocked" -ForegroundColor Red -NoNewline ; Write-Host " Firewall Rules...."

        Write-Output ""

            Get-NetFirewallRule | Where-Object Action -eq "Block" | Format-Table DisplayName,Enabled,Profile,Direction,Action,Name

        Write-Output ""