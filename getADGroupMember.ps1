#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter GroupName"

# get-ADGroup -Filter  "Name -like '$name*'"|ft

 
Get-ADGroupMember -Identity $name|select distinguishedName,name,samaccountname