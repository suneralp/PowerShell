function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

Import-Module activedirectory

$logfile = "c:\temp\" + (Get-Date -f yyyy-MM-dd-hh-mm) + ".log"
$ADUsers = Import-Csv c:\temp\ContractorIDstoUpdateADALL.csv  -Delimiter ","



foreach ($User in $ADUsers)
{
            $SamAccountName = $User.samaccountname
            $WorkdayID = $User.employeeID
            $Lastname = $User.LASTNAME
            $Firstname = $User.FIRSTNAME
            
    if (Get-ADUser -F {SamAccountName -eq $samaccountname})
        {
           Set-ADUser -Identity $samaccountname -EmployeeID $user.WorkdayID

           #echo $user.WorkdayID

            $X = Get-TimeStamp
                write-output $X  | Out-File -FilePath $logfile  -append

           $a=$user.WorkdayID

           Write-Output "A user account with username $SamAccountName  exists in Active Directory and EmployeeID has been updated as $a" 

           Write-Output "A user account with username $SamAccountName  exists in Active Directory and EmployeeID has been updated $a" |Out-File -FilePath $logfile  -append
          
                              
        }
    else
        {
        Write-Warning "Failed to update user $SamAccountName  in Active Directory." 

      }

      get-ADUser -Identity $SamAccountName -Property *|Select employeeID,samAccountName,Displayname
}
