# Cmdlets
## Get-Command
Gets all commands that are installed on the computer.
```powershell
Get-Command -Noun Computer # all commands that contain the noun "computer"
```

## Get-ChildItem
Gets the items and child items in one or more specified locations.
```powershell
Get-ChildItem -path 'C:\Program Files' -Recurse -File -Force -Include *.exe -Exclude w*
Get-ChildItem -Path C:\Test -File -Recurse | Remove-Item 
```

## Get-Computerinfo
Gets a consolidated object of system and operating system properties.

## Get-ExecutionPolicy
Gets the execution policies for the current session.

## Get-Help
Displays information about PowerShell commands and concepts.
```powershell
Get-Help Format-Table
```

## Get-Process
Gets the processes that are running on the local computer.
```powershell
Get-Process | Sort-Object -Property CPU -Descending # get processes sorted by CPU time
```

## Read-Host
Reads a line of input from the console.
```powershell
$Age = Read-Host "Please enter your age"
```

## Set-ExecutionPolicy
Sets the PowerShell execution policies for Windows computers.
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

## Start-Transcript
Creates a record of all or part of a PowerShell session to a text file.

## Test-Connection
Sends ICMP echo request packets, or pings, to one or more computers.

## Test-NetConnection
Displays diagnostic information for a connection.

## Test-Path
Determines whether all elements of a path exist.
```powershell
Test-Path -Path $profile
Test-Path -Path $profile -IsValid # check if syntax is valid
```

## Write-Host
Produce display-only output
```powershell
Write-Host "Hello World" -ForegroundColor Red
```
