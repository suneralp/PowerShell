 echo ""
 echo "Please Wait ..."
  echo ""
 
 get-ADUser -filter {(PasswordNeverExpires -eq $true) -and (Enabled -eq $true)} | Select-Object Name,SamAccountName,SID,UserPrincipalName|more
 echo "Please Wait ..."