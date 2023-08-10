#!/usr/bin/env pwsh
echo ""
echo "Please Wait ..." 
echo ""
Search-ADAccount -LockedOut |select  DistinguishedName, SamAccountName,UserPrincipalName