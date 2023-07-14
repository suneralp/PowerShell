$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"

$password = ConvertTo-SecureString $pwdTxt -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential('alper',$password)

$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk

#Convert Password to SecureString
$Password = ConvertTo-SecureString -String "Secret1337$" -AsPlainText -Force

#Additional account details
$platformAccountProperties = @{
	"LOGONDOMAIN"    = "mylab.local"
	}

#Add Account

echo ""
$Safe= Read-Host -Prompt "Enter Safe Name"
$Platform= Read-Host -Prompt "Enter Platform ID"
$UserName= Read-Host -Prompt "Enter UserName"

$checkAccount = Get-PASAccount -search $userName

if ( $checkAccount -eq $null ) {
Add-PASAccount -secretType Password -secret $Password -SafeName $Safe -PlatformID $Platform `
	-Address mylab.local -Username $UserName -platformAccountProperties $platformAccountProperties
}
else {
        
         Write-Host "A user account with username $UserName already onboarded on CyberArk." -ForegroundColor Cyan
        }     

 $AccountID = Get-PASAccount -search $userName| findstr "AccountID"| %{ $_.Split(':')[1]; }
 Invoke-PASCPMOperation -AccountID $AccountID -ReconcileTask
 Write-Host "Reconcilation task has been triggered for the account $UserName" -ForegroundColor Cyan

Close-PASSession

