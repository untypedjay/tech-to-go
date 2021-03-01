Get-ADUser -Filter * -Properties * |
Select-Object -Property Name,SID,whenCreated,LastLogonDate | 
Export-Csv -Path C:\Temp\adusers.csv -NoTypeInformation
