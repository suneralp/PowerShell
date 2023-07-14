#$credential.Username
#$credential.GetNetworkCredential().Password
#Install-Module -Name CredentialManager
#Get-Credential -Credential $credential

##Install-Module -Name psPAS -Scope CurrentUser


$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"

$password = ConvertTo-SecureString $pwdTxt -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential('alper',$password)

$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk

$token |Add-PASSafe -SafeName ALPERSAFE2 -Description "ALPERSAFE2" -ManagingCPM PasswordManager -NumberOfVersionsRetention 7

#Add-PASSafeMember -SafeName ALPERSAFE2 -SearchIn Vault -MemberName "Administrator" -UseAccounts $true -ListAccounts $true -RetrieveAccounts $true -AddAccounts $true -UpdateAccountContent $true -RenameAccounts $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -DeleteAccounts $true -DeleteFolders $true -UnlockAccounts $true -ManageSafe $true -ManageSafeMembers $true -ViewAuditLog $false -ViewSafeMembers $true -CreateFolders $true -MoveAccountsAndFolders $true -AccessWithoutConfirmation $true

#Close-PASSession
