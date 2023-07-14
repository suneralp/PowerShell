$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"
$pwd = ConvertTo-SecureString $pwdTxt -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential('alper',$pwd)
$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk


echo ""
#$Safe= Read-Host -Prompt "Enter Safe Name"
$UserName= Read-Host -Prompt "Enter UserName"


$checkAccount = Get-PASAccount -search $userName

if ( $checkAccount -eq $null ) {

Write-Host "A user account with username $UserName was not onboarded on CyberArk." -ForegroundColor Cyan


}
else {
        
        Get-PASAccount -search $UserName       
        }     
