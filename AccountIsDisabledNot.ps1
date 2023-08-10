#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter SamAccountName"


get-ADUser -Identity $name -Properties * | Select useraccountcontrol