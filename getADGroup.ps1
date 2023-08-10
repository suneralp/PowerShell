#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter GroupName"

get-ADGroup -Filter  "Name -like '$name*'"|ft

 
# Get-ADGroupMember -Identity cyberark-admins|select distinguishedName,name,samaccountname