New-Item "C:\Shares\hackme" -itemType Directory
New-SmbShare -Name "hackme" -Description "Hack my Share" -Path "C:\Shares\hackme" -FullAccess 'Everyone'