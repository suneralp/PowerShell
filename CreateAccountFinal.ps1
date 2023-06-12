function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

Import-Module activedirectory
$logfile = "C:\Users\alp\PowerShell\ADUSERCREATION\LOGS\" + (Get-Date -f yyyy-MM-dd-hh-mm) + ".log"
$UPN = "mylab.local" 
$ADUsers = Import-Csv C:\Users\alp\PowerShell\ADUSERCREATION\NewAccounts_20230517_041621AM.csv  -Delimiter ","

 

foreach ($User in $ADUsers)
{
            $SamAccountName = $User.employeeID
            $EmployeeNumber = $User.employeeID
            $EmployeeID = $user.employeeID
            $Firstname = $User.firstname
            $Lastname = $User.lastname
            $Division = $User.Division
            $Company = $User.Company
            $SuperVisorID = $User.SuperVisorID
 
    if (Get-ADUser -F {SamAccountName -eq $EmployeeID})
        {
          Write-Warning "A user account with username $SamAccountName already exists in Active Directory." 
          Write-output "A user account with username $SamAccountName already exists in Active Directory." | Out-File -FilePath $logfile  -append
        }
    else
        {
            New-ADUser `
                -SamAccountName $SamAccountName `
                -UserPrincipalName "$EmployeeID@$UPN" `
                -Name "$Firstname $Lastname" `
                -EmployeeNumber $EmployeeNumber `
                -GivenName $Firstname `
                -Surname $Lastname `
                -AccountPassword (ConvertTo-secureString "PassWord123" -AsPlainText -Force) -ChangePasswordAtLogon $True `
                -EmployeeID $EmployeeID `
                -Enabled $True `
                -Path "OU=MOT,OU=USER,DC=MYLAB,DC=LOCAL" `
                -DisplayName "$firstname $lastname" `
                -Division $Division `
                -Company $Company `
                -Manager $SuperVisorID
                $X = Get-TimeStamp
                write-output $X  | Out-File -FilePath $logfile  -append
                Write-Warning "The user account $SamAccountName is created logfile generated"
                Write-output "The user account $SamAccountName is created."|Out-File -FilePath $logfile  -append
                get-ADUser -Identity $SamAccountName -Property *|Select employeeID,employeenumber,distinguishedname,samAccountName,UserPrincipalName,GivenName,Surname,DisplayName,Manager,Enabled,Company,Division|Out-File -FilePath $logfile  -append

        }
}

             