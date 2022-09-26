# By Threats Experts University
# Checks if the machine is a VM or not

[CmdletBinding()] Param()
    $ErrorActionPreference = "SilentlyContinue"
    #Hyper-V
    $hyperv = Get-ChildItem HKLM:\SOFTWARE\Microsoft
    if (($hyperv -match "Hyper-V") -or ($hyperv -match "VirtualMachine"))
        {
            $hypervm = $true
        }

    if (!$hypervm)
        {
            $hyperv = Get-ItemProperty hklm:\HARDWARE\DESCRIPTION\System -Name SystemBiosVersion
            if ($hyperv -match "vrtual")
                {
                    $hypervm = $true
                }
        }
    
    if (!$hypervm)
        {
            $hyperv = Get-ChildItem HKLM:\HARDWARE\ACPI\FADT
            if ($hyperv -match "vrtual")
                {
                    $hypervm = $true
                }
        }
            
    if (!$hypervm)
        {
            $hyperv = Get-ChildItem HKLM:\HARDWARE\ACPI\RSDT
            if ($hyperv -match "vrtual")
                {
                    $hypervm = $true
                }
        }

    if (!$hypervm)
        {
            $hyperv = Get-ChildItem HKLM:\SYSTEM\ControlSet001\Services
            if (($hyperv -match "vmicheartbeat") -or ($hyperv -match "vmicvss") -or ($hyperv -match "vmicshutdown") -or ($hyperv -match "vmiexchange"))
                {
                    $hypervm = $true
                }
        }
   
    if ($hypervm)
        {
    
             "This is a Hyper-V machine."
    
        }

    #VMWARE

    $vmware = Get-ChildItem HKLM:\SYSTEM\ControlSet001\Services
    if (($vmware -match "vmdebug") -or ($vmware -match "vmmouse") -or ($vmware -match "VMTools") -or ($vmware -match "VMMEMCTL"))
        {
            $vmwarevm = $true
        }

    if (!$vmwarevm)
        {
            $vmware = Get-ItemProperty hklm:\HARDWARE\DESCRIPTION\System\BIOS -Name SystemManufacturer
            if ($vmware -match "vmware")
                {
                    $vmwarevm = $true
                }
        }
    
    if (!$vmwarevm)
        {
            $vmware = Get-Childitem hklm:\hardware\devicemap\scsi -recurse | gp -Name identifier
            if ($vmware -match "vmware")
                {
                    $vmwarevm = $true
                }
        }

    if (!$vmwarevm)
        {
            $vmware = Get-Process
            if (($vmware -eq "vmwareuser.exe") -or ($vmware -match "vmwaretray.exe"))
                {
                    $vmwarevm = $true
                }
        }

    if ($vmwarevm)
        {
    
             "This is a VMWare machine."
    
        }
    
    #Virtual PC

    $vpc = Get-Process
    if (($vpc -eq "vmusrvc.exe") -or ($vpc -match "vmsrvc.exe"))
        {
        $vpcvm = $true
        }

    if (!$vpcvm)
        {
            $vpc = Get-Process
            if (($vpc -eq "vmwareuser.exe") -or ($vpc -match "vmwaretray.exe"))
                {
                    $vpcvm = $true
                }
        }

    if (!$vpcvm)
        {
            $vpc = Get-ChildItem HKLM:\SYSTEM\ControlSet001\Services
            if (($vpc -match "vpc-s3") -or ($vpc -match "vpcuhub") -or ($vpc -match "msvmmouf"))
                {
                    $vpcvm = $true
                }
        }

    if ($vpcvm)
        {
    
         "This is a Virtual PC."
    
        }


    #Virtual Box

    $vb = Get-Process
    if (($vb -eq "vboxservice.exe") -or ($vb -match "vboxtray.exe"))
        {
    
        $vbvm = $true
    
        }
    if (!$vbvm)
        {
            $vb = Get-ChildItem HKLM:\HARDWARE\ACPI\FADT
            if ($vb -match "vbox_")
                {
                    $vbvm = $true
                }
        }

    if (!$vbvm)
        {
            $vb = Get-ChildItem HKLM:\HARDWARE\ACPI\RSDT
            if ($vb -match "vbox_")
                {
                    $vbvm = $true
                }
        }

    
    if (!$vbvm)
        {
            $vb = Get-Childitem hklm:\hardware\devicemap\scsi -recurse | gp -Name identifier
            if ($vb -match "vbox")
                {
                    $vbvm = $true
                }
        }



    if (!$vbvm)
        {
            $vb = Get-ItemProperty hklm:\HARDWARE\DESCRIPTION\System -Name SystemBiosVersion
            if ($vb -match "vbox")
               +zf��׫����Ơy�ʉ��ם��%j�