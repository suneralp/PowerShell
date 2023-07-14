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
$UserName= Read-Host -Prompt "Enter UserName"

$checkAccount = Get-PASAccount -search $userName

if ( $checkAccount -eq $null )
  {
    Write-Host "A user account with username $UserName was not onboarded on CyberArk." -ForegroundColor Cyan
  }
else {
        
    $AccountID = Get-PASAccount -search $userName| findstr "AccountID"| %{ $_.Split(':')[1]; }
    Invoke-PASCPMOperation -AccountID $AccountID -ReconcileTask
     Write-Host "Reconcilation task has been triggered for $UserName" -ForegroundColor Cyan

    }     
    
Close-PASSession

