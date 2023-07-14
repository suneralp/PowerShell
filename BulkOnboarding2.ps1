$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"
$pwd = ConvertTo-SecureString $pwdTxt -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential('alper',$pwd)
$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk
$Accounts = Import-Csv -Path C:\alp\accounts.csv

$platformAccountProperties = @{
	"LOGONDOMAIN"    = "mylab.local"
	}


foreach($Account in $Accounts){
$Password = ConvertTo-SecureString -String "Secret1337$" -AsPlainText -Force
$checkAccount = Get-PASAccount -search $Account.userName


if ( $checkAccount -eq $null ) 
        {
            Add-PASAccount -secretType Password `
            -secret $Password `
            -SafeName $Account.SafeName `
            -PlatformID $Account.PlatformID `
            -Address $Account.Address `
            -Username $Account.Username `
            -platformAccountProperties $platformAccountProperties 

             Write-Host "Account with username "$Account.UserName" has onboarded on CyberArk." -ForegroundColor Red
        }
     
 else   {
             Write-Host "A user account with username "$Account.Username" already onboarded on CyberArk." -ForegroundColor Cyan
        }    
  
  $AccountID = Get-PASAccount -search $Account.username| findstr "AccountID"| %{ $_.Split(':')[1]; }
                               Invoke-PASCPMOperation -AccountID $AccountID -ReconcileTask
                               echo ""
                               Write-Host "Reconcilation task has been triggered for "$Account.UserName"" -ForegroundColor Cyan              
}