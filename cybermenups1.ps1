#!/usr/bin/env pwsh

$Env:PATH += ";C:\Program Files\PowerShell\7;C:\alp\"

Function Menu 
{
	$tab = [char]9 
    Clear-Host        
    Do
    {
        Clear-Host                                                                       
        Write-Host -Object 'Please choose an option'
        Write-Host     -Object '**********************'
        Write-Host -Object ' CyberArk Operations Menu' -ForegroundColor Green
        Write-Host -Object '**********************'
          echo ""
		#Write-Host -Object '-----------------------------------------'
		#Write-Host -Object ' SAFE OPERATIONS' -ForegroundColor Yellow
		#Write-Host -Object '-----------------------------------------'
	    Write-Host -Object " 1 - Create Safe"
        echo ""
		Write-Host -Object " 2 - Get Safe Details"
           echo ""
		Write-Host -Object " 3 - Remove Safe"
        echo ""
		Write-Host -Object " 4 - Onboard Account"
        echo ""
		Write-Host -Object " 5 - Reconcile Account"
        echo ""
		Write-Host -Object " 6 - Verify Account"
        echo ""	
		#Write-Host '---------------------------------------------'           
		#Write-Host ' User|Computer|Groups' -ForegroundColor Yellow
		#Write-Host '---------------------------------------------'
		Write-Host -Object " 7 - Get all accounts from TargetSafe"
        echo ""
		Write-Host -Object " 8 - Get Account Details"
        echo ""
		Write-Host -Object " 9 - Get details of Active PSM sessions"
        echo ""

        Write-Host -Object "10 - Get All active Platforms"
        echo ""
         Write-Host -Object "11 - On-board Multiple Accounts"

        #echo ""
		Write-Host -Object ''
        
        Write-Host -Object 'Q.  Quit'
        echo ""
        Write-Host -Object $errout
        $Menu = Read-Host -Prompt '(0-20 or Q to Quit)'
 
        switch ($Menu) 
        { 
           1 
            {
              #1.ps1                   
              PowerShell.exe -command "C:\alp\CreateSAFE.ps1"                                 
              cmd /c pause 
            }
			
            2 
            {
              # PowerShell.exe -command "C:\Users\alp\PowerShell\getADUserLike.ps1"
			  PowerShell.exe -command "C:\alp\getSafeDetails.ps1"
              cmd /c pause 
            }
			
            3 
            {
               # PowerShell.exe -command "C:\Users\alp\PowerShell\getADUserWithAttr.ps1"
			    PowerShell.exe -command "C:\alp\RemSafe.ps1"
              cmd /c pause
            }
			
	        4 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\getADUserWithSpcAttr.ps1"
			   PowerShell.exe -command "C:\alp\AddDmnAccount.ps1"
				
              cmd /c pause
            }
			
			5 
            {
             #   PowerShell.exe -command "C:\Users\alp\PowerShell\FindAllLockedUserAccounts.ps1"
			    PowerShell.exe -command "C:\alp\ReConAcct.ps1"
              cmd /c pause
            }
			
			6 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\NeverExpireUsers.ps1"
			   PowerShell.exe -command "C:\alp\VerAcct.ps1"
              cmd /c pause
            }
			
			7 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\GetADGroup.ps1"
			   PowerShell.exe -command "C:\alp\GetAllAcctsSafe.ps1"
				
              cmd /c pause
            }
			
			8 
            {
                #PowerShell.exe -command "C:\Users\alp\PowerShell\GetADGroupMember.ps1"
				PowerShell.exe -command "C:\alp\getPasAcct.ps1"
              cmd /c pause
            }
			
		   9 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\UnlockAccount.ps1"
			   PowerShell.exe -command "C:\\alp\GetPSMSessions.ps1"
             cmd /c pause
            }
			
			10 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\UnlockAccount.ps1"
			   PowerShell.exe -command "C:\\alp\getActivePlatforms.ps1"
             cmd /c pause
            }
			
            11 
            {
               #PowerShell.exe -command "C:\Users\alp\PowerShell\UnlockAccount.ps1"
			   PowerShell.exe -command "C:\alp\BulkOnboarding2.ps1"
             cmd /c pause
            }

            Q 
            {
                Exit
            }   
            default
            {
                $errout = 'Invalid option please try again........Try 0-4 or Q only'
            }
 
        }
    }
    until ($Menu -eq 'q')
}   
 
# Launch The Menu
Menu

#'userAccountControl
