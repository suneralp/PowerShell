
$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"

$password = ConvertTo-SecureString $pwdTxt -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential('alper',$password)

$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk

#New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk

#Remove-PASSafe -SafeName ALPERSAFE2

#Add-PASSafeMember -SafeName ALPERSAFE2 -MemberName "Rex" -SearchIn "Vault" -UseAccounts $true -ListAccounts $true -RetrieveAccounts $true -AddAccounts $true -UpdateAccountContent $true -RenameAccounts $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -DeleteAccounts $true -DeleteFolders $true -UnlockAccounts $true -ManageSafe $true -ManageSafeMembers $true -ViewAuditLog $true -ViewSafeMembers $true -CreateFolders $true -MoveAccountsAndFolders $true -AccessWithoutConfirmation $true

#Add-PASSafeMember -SafeName ALPERSAFE2 -SearchIn "Vault" -MemberName "Rex"  
    
Get-PASSafe -SafeName ALPERSAFE

Close-PASSession