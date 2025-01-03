# Create a new AD user named "lowpriv"
New-ADUser -name 'lowpriv' -AccountPassword (Read-Host -AsSecureString "AccountPassword") -Enabled $true

# Creates 15 folders in C:\Shares, named Share[1-15]​ and creates an SMB share from each folder called Logs[1-15]
# Denies user "lowpriv" access to the shares
$numbers = 1..15
foreach($number in $numbers) 
{
    New-Item "C:\Shares\Share$number" -itemType Directory
    New-SmbShare -Name "Logs$number" -Description "Test Share $number" -Path "C:\Shares\Share$number" -NoAccess lowpriv -FullAccess 'Everyone'
}