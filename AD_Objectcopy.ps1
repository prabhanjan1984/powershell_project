<#This script is used for moving bulk AD objects from one OU to another 
 with logging #>
 Write-host "********This is a script only to move the AD user objects which are disabled from 
             one  OU to another and no objects will be modified********* 

  For assistance please reach out to k.prabhanjan@atos.net & krishna.jambagi@atos.net   " -BackgroundColor Yellow -ForegroundColor Black


 # Identify and save the disabled obejects in variable call $diable
 
$user =Get-ADUser -filter{enabled  -eq "false"}|select -Property name
write-host "Total Number of Disabled USER is"  $user.count  -BackgroundColor Green
Write-Host "Moving disabled objects to OU OU=Disabled Accounts,DC=asn,DC=nam" -BackgroundColor Green
Search-ADAccount -AccountDisabled |Move-ADObject -TargetPath "OU=Disabled Accounts,DC=asn,DC=nam"
Write-host "Completed moving" $user.Count  "user objects to Disabled OU Thank you" -BackgroundColor Yellow

 

 


 

 
