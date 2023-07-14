#!/usr/bin/env pwsh

$Env:PATH += ";C:\Program Files\PowerShell\7;C:\alp\"

$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"

$password = ConvertTo-SecureString $pwdTxt -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential('Administrator',$password)

$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk


$safename= Read-Host -Prompt "Enter Safe Name"
$description= Read-Host -Prompt "Enter Description of Safe"

Add-PASSafe -SafeName $safename -Description $description -ManagingCPM PasswordManager -OLACEnabled $true -NumberOfVersionsRetention 7
echo ""
 Write-Host "$safename safe created." -ForegroundColor Cyan



Close-PASSession