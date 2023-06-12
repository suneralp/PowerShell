 function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    
}

Import-Module activedirectory

$logfile = "c:\scripts\" + (Get-Date -f yyyy-MM-dd-hh-mm) + ".log"


$Users = Import-csv C:\Users\alp\PowerShell\ADUSERCREATION\disableusers.txt

foreach ($User in $Users) {
  
   $Username       = $User.SamAccountName

      if (Get-ADUser -F {SamAccountName -eq $Username}) {
         
         Write-Warning "An account with username $Username is disabled."
         Set-ADUser -Identity $Username -Enabled $false
        
         $X = Get-TimeStamp
         write-output $X  | Out-File -FilePath $logfile  -append  
                
         get-ADUser -Identity $username |Select-Object -Property samaccountname,enabled|Out-File -FilePath $logfile  -append
    }
    else {
        
         Write-Host "A user account with username $Username does not exist in Active Directory." -ForegroundColor Cyan
        }     

     
   
    } 
  
