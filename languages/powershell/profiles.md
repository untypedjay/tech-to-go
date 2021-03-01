# PowerShell Profiles
The variable `$profile` stores the path of the profile that will be executed everytime PowerShell gets started.

Add a new user profile with `New-Item $profile -Force` and open it with `ise $profile`.

The profile file could look like this:
```powershell
$host.ui.rawui.windowtitle="Company Inc. | John Doe | Senior Frontend Engineer"

Set-PSReadLineOption -colors @{
  Operator           = 'Cyan'
  Parameter          = 'Cyan'
  String             = 'White'
}

function search {
    Start-Process "https://duckduckgo.com/?t=ffab&q=$args&ia=web"
}

Clear-Host

Get-Date

Write-Host "Logged on user: $env:username"
```
