# Prompt for password for all accounts
$secpass = Read-Host "Enter Default Password for Accounts" -AsSecureString

# Pipe names.csv file to foreach loop
Import-Csv users.csv |
foreach {
  $name = "$($_.FirstName) $($_.LastName)"
  $OU1 = "$($_.OU1)"
  $OU2 = "$($_.OU2)"

 New-ADUser -GivenName $($_.FirstName) -Surname $($_.LastName) `
 -Name $name -SamAccountName $($_.SamAccountName) `
 -UserPrincipalName "$($_.SamAccountName)@ad.CEG2410.com" `
 -AccountPassword $secpass -Path "ou=$OU2,ou=$OU1,dc=ad,dc=CEG2410,dc=com" `
 -Enabled:$true
}