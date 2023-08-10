#!/usr/bin/env pwsh

 Write-Host "This section shows the latest Users Active Directory Logon based on all Domain Controllers of $env:userdnsdomain." -ForegroundColor Green
        

        do {

        do {
        ''
        Write-Host 'Enter USER LOGON NAME (Q to quit)' -ForegroundColor Yellow
        ''
        $userl=Read-Host 'USER LOGON NAME'
        
        If ($userl -eq 'Q') {Break}
        
        $ds=dsquery user -samid $userl

        ''

        If ($ds)

        {

        Write-Host "User $userl found! Please wait ... contacting all Domain Controllers ... Showing results from most current DC ..." -ForegroundColor Green

        }

        else 

        {


        Write-Host "User $userl not found. Try again" -ForegroundColor Red}
        
        }

        while (!$ds)
 
        $resultlogon=@()

        If ($userl -eq 'Q') {Break}

        $getdc=(Get-ADDomainController -Filter *).Name

        foreach ($dc in $getdc) {

        Try {
        
        $user=Get-ADUser $userl -Server $dc -Properties lastlogon -ErrorAction Stop
        
        $resultlogon+=New-Object -TypeName PSObject -Property ([ordered]@{
                
                'Most current DC' = $dc
                'User' = $user.Name
                'LastLogon' = [datetime]::FromFileTime($user.'lastLogon')
                
                })
        
        }

        Catch {
        ''
        Write-Host "No reports from $dc!" -ForegroundColor Red

        }

        }
        
        

        If ($userl -eq 'Q') {Break}
        ''

        $resultlogon | Where-Object {$_.lastlogon -NotLike '*1601*'} | Sort-Object LastLogon -Descending | Select-Object -First 1 | Format-Table -AutoSize

        If (($resultlogon | Where-Object {$_.lastlogon -NotLike '*1601*'}) -EQ $null)

        {
        
        ''
        Write-Host "All domain controllers report that the user"$user.name"has never logged on til now." -ForegroundColor Red}
        
        Write-Host 'Search again? Press Y or any other key to quit ' -ForegroundColor Yellow
        ''
        $input=Read-Host 'Enter (Y/N)'