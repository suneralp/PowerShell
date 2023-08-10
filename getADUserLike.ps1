#!/usr/bin/env pwsh

$name= Read-Host -Prompt "Enter Name"

get-ADUser -Filter "Name -eq '$name'"
