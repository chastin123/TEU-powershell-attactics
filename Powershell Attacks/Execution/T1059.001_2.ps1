
# By Threats Experts University
#Floods the user with infinite random numbers

$flood = @(' 
 
          _.====.._
         ,:._       ~-_
             `\        ~-_
               | _\ \  |  `.
             ,/  / | |    ~-_
    -..__..-''   _ _ `_      ~~--..__...----... FLOOOODING ...
    ')


    Write-Host $flood -ForegroundColor Blue

    Start-Process powershell -ArgumentList 'while($true){$a = Get-Random; Invoke-Command -ArgumentList $a -ScriptBlock {$args[0]}}'