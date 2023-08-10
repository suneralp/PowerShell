#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter SamAccountName"

get-ADUser -Identity $Name -Property *|Select samAccountName,Displayname,ExtensionAttribute5,EmployeeID