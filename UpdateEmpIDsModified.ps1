function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

Import-module ActiveDirectory 

$logfile = "C:\Scripts\cfoster\" + (Get-Date -f yyyy-MM-dd-hh-mm) + ".log"
$ADUsers = Import-CSV "C:\Scripts\cfoster\FTEs_and_CWs.csv" -Delimiter ","

foreach ($User in $ADUsers)
{
	$WorkdayWorkerID 	= 	$_.WorkdayWorkerID
	$PeopleSoftEmplid 	= 	$_.PeopleSoftEmplid
	

$user = Get-ADUser -Filter * -Properties * |
        Where-Object { $_.EmployeeID -eq $_.PeopleSoftEmplid } |
		Select-Object SamAccountName 		
		
		 if (Get-ADUser -F {EmployeeID -eq $PeopleSoftEmplid})
			 {
       			Write-Host "Attempting to update Employee ID:$PeopleSoftEmplid to Workday ID:$WorkdayWorkerID." -ForegroundColor Cyan
				Set-ADUser $User.SamAccountName  -employeeID $WorkdayWorkerID -ErrorAction Continue  
		        {
		 else
			 {
				Write-Host "Employee ID:'$PeopleSoftEmplid' not found or failed to update:" -ForegroundColor Red
				Write-Host $_                $PeopleSoftEmplid |Out-File -FilePath $logfile  -append
			 }
}
				
				
			 
			 