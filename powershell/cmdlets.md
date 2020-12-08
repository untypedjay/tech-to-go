# Cmdlets
## Get-Command
Gets all commands that are installed on the computer.

## Get-ExecutionPolicy
Gets the execution policies for the current session.

## Get-Help
Displays information about PowerShell commands and concepts.
```powershell
Get-Help Format-Table
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
