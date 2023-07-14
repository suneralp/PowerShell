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
Add-PASAccount -secretType Password -secret $Password -SafeName "WIN-DOM-ACCT" -PlatformID "WinDmnAcct" `
	-Address mylab.local -Username Angella.Key -platformAccountProperties $platformAccountProperties

#$token |Add-PASSafeMember -SafeName "ALPERSAFE" -SearchIn "vault" -MemberName "Administrator" -UseAccounts $true -ListAccounts $true -RetrieveAccounts $true -AddAccounts $true -UpdateAccountContent $true -RenameAccounts $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -DeleteAccounts $true -DeleteFolders $true -UnlockAccounts $true -ManageSafe $true -ManageSafeMembers $true -ViewAuditLog $true -ViewSafeMembers $true -CreateFolders $true -MoveAccountsAndFolders $true -AccessWithoutConfirmation $true

Close-PASSession