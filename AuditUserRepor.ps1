# PowerShell Script: Audit and Report Active Directory Group Membership 

# Import Active Directory module
Import-Module ActiveDirectory

# Specify output file path
$outputFile = "C:\AD_GroupMembership_Report.csv"

# Function to get group membership
function Get-GroupMembership {
    param (
        [string]$GroupName
    )

    try {
        # Get group members
        $members = Get-ADGroupMember -Identity $GroupName -Recursive | Where-Object { $_.objectClass -eq 'user' }

        foreach ($member in $members) {
            $user = Get-ADUser -Identity $member.SamAccountName -Properties LastLogonDate
            [PSCustomObject]@{
                GroupName = $GroupName
                UserName = $user.SamAccountName
                DisplayName = $user.Name
                LastLogonDate = $user.LastLogonDate
            }
        }
    } catch {
        Write-Host "Failed to process group: $GroupName. Error: $_" -ForegroundColor Red
    }
}

# Get all groups in the domain
$groups = Get-ADGroup -Filter * | Select-Object -ExpandProperty Name

# Initialize results array
$results = @()

# Loop through groups to gather membership
foreach ($group in $groups) {
    $results += Get-GroupMembership -GroupName $group
}

# Export results to CSV
$results | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8

Write-Host "Report generated successfully at $outputFile" -ForegroundColor Green
