#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter SamAccountName"

get-ADUser -Identity $name -Property * |select DistinguishedName,AccountExpirationDate,Enabled,givenName,sn,DisplayName,SamAccountName,EmployeeID,EmployeeNumber,UserPrincipalName,ExtensionAttribute5