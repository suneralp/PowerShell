
Import-Module activedirectory

$logfile = "C:\Users\PCTR896541\PowerShell\" + (Get-Date -f yyyy-MM-dd-hh-mm) + ".log"



$FILE = Get-Content "C:\Users\PCTR896541\PowerShell\users.txt"

foreach ($LINE in $FILE)

{

#Get-MgUser -UserId $LINE | Out-File -FilePath $logfile  -append

Get-MgUser -UserId $LINE 
Get-AzureADObjectByObjectId -ObjectIds 9968a226-39be-47a2-82c5-63119b2eb5c5


}

