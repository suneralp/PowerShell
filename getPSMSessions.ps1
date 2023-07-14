
$pwdTxt = Get-Content "C:\temp\ExportedPassword.txt"
$pwd = ConvertTo-SecureString $pwdTxt -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential('alper',$pwd)
$token = New-PASSession -Credential $credential -BaseURI https://pvwa.mylab.local -type CyberArk


 Get-PASPSMSession
