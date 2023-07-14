
#!/usr/bin/env pwsh

$Env:PATH += ";C:\Program Files\PowerShell\7;C:\alp\"

$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"

$password = ConvertTo-SecureString $pwdTxt -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential('Administrator',$password)

$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk

#Get-PASSafe  -SafeName WIN-DOM-ACCT 

$safename= Read-Host -Prompt "Enter Safe Name"

Get-PASAccount -SafeName $safename
