#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter SamAccountName"
$attr= Read-Host -Prompt "Enter Attribute Name"

get-ADUser -Identity $name -Properties * | Select $attr