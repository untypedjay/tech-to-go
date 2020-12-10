# PowerShell Concepts
> PowerShell is a task automation and configuration management framework
> from Microsoft, consisting of a command-line shell and a associated
> scripting language.

The following windows server editions can only be administrated using
PowerShell:
* Windows Server Core
* Nano Server (lightweight container)

## Execution Policy
The execution policy prohibits the unintentional execution of PowerShell scripts:
* Restricted -> default at Windows 10
* Unrestricted
* RemoteSigned -> default at Windows Server
* AllSigned

## Pipeline
The pipeline is in powershell the connection between two cmdlets. The output of one cmdlet is being passed to another.
```powershell
'Patrick', 'Patrick', 'Herbert' | Get-Unique
```

Change the city of all users in an organizational unit:
```powershell
Get-ADUser -Filter * | Set-ADUser -City 'Vienna'
```
Pipeline input can be
* by value or
* by PropertyName (most common)

Get help about parameters:
```powershell
Get-Help Set-Service -Parameter *
```

## Formatting and Output
Per default, the output will be a table or a list. `Format-Table` can only display 10 columns. `Format-Wide` outputs a wide table with only one property.
Format a table properly: `Get-Service | Format-Table -AutoSize -Wrap`
Format into a List: `Get-Service | Format-List`
Format wide: `Get-Service | Format-Wide`

`Format-Table` and `Format-List` should not be used too much. Only for a good view at the end of the pipe, because they change the objects in a way, it can not be further processed.
Same is with `Write-Host`. Use it only if you want to work with colors. Otherwise, use `Write-Object`.

```ps
Get-Process | Export-Csv -Path C:\Temp\Processes.csv -Delimiter : -NoTypeInformation
Import-Csv -Path C:\Temp\Processes.csv -Delimiter :
```

```ps
(Get-ADComputer -Filter *).Name | 
Foreach-Object {Invoke-Command -ComputerName $_ {systeminfo /FO CSV}} | 
ConvertFrom-Csv | 
Out-GridView
```
`Out-GridView` pops up a graphical table window.

## `$_` and `$PSItem`
This are pipeline variables that contain the object that is currently in the pipe.
Check the attributes: `Get-Process | Get-Member`

## Filtering
List processes that start with s and have a CPU time under 5 seconds:
```ps
Get-Process | Where-Object {$_.Name -like "s*" -and $_.CPU -lt 5}
```

Using `-Filter`, only a specific part of the objects will be sent to the pipe. This is way faster than `Where-Object`, so use it wherever possible.
## `Sort-Object` and `Select-Object`
`Sort-Object` sorts objects:
```ps
Get-Process | Sort-Object -Property CUP -Descending
```
`Select-Object` selectes object properties:
```ps
Get-Process | Sort-Object -Property WS | Select-Object -Last 5
```
Using `-ExpandProperty` shows only the value of the property. The name will no be shown. This is necessary for further processing.
It is recommended to sort before selecting objects.

### Custom Properties
```ps
Get-ChildItem -Path C:\Temp -File -Recurse | Sort-Object Length -Descending |
Select-Object -Property Name, LastWriteTime, @{n='Size (MB)'; e={[math]::Round(($_.length/1MB),0)}}
```

## Properties
Get all members (including properties and members) of an ad user:
```ps
Get-ADUser user123 -Properties * | Get-Member
```

Sort and select properties:
```ps
Get-ADUser -Filter * -Properties whenCreated | 
Sort-Object -Property whenCreated -Descending | 
Select-Object -Property Name,whenCreated
```

## Methods
Can be explored in the same way as properties with `Get-Member`.
Methods can be called like this: `(Get-Date).Day`

## Data Types
Data types are defined using `[]`: `$ip=[ipaddress] '192.168.1.1'`
Check the data type: `'Test'.GetType()`
Check if something is a string: `'Test' -is [String]`

Important data types:
* String
* Integer
* IPAddress
* Character
* DateTime
* Boolean
* Array (fixed size)
* Hashtable

For each data type, specific methods exist. Example: `'Test'.Replace('e', 'a')`

### Arrays
Can not be extended afterwards.
```ps
[array] $array=('Peter', 'Margit')
$array[0]
$array[1]
```

### Hashtable
Contains key-value pairs. Can be extended afterwards.
```ps
$hash=@{Kevin = '1 Euro'; Alex = '9 Euro'}
$hash.Add('Markus', '10 Euro')
$hash
```

### Strings
```ps
$a= 'CN=Jeff Bezos,OU=Businessman,DC=amazon,DC=COM'

# setting anchors
$anchor1 = $a.IndexOf('=')
$anchor2 = $a.IndexOf(',')

# show OUs, +1 to exclude the anchor
$a.Substring($anchor2 + 1)

# show user OU (nearest to the object)
$a.Split(',')[-4]

# show first and last
$a.Substring($anchor1 + 1, $anchor2 - 1 -$anchor1)

# show last name
$a.Substring($anchor1 + 1,$anchor2 - 1 -$anchor1).Split('')[1]
```

## Windows Management Instrumentation (WMI)
WMI makes it possible to access all settings both reading and writing.
1. Discover with `Get-Member` or `Select-Object -Property *`
2. Call a method

```ps
Get-CimInstance Win32_OperatingSystem | Select-Object -Property LastBootUpTime
```

Important classes:
* Win32_OperatingSystem
* Win32_ComputerSystem
* Win32_UserAccount
* Win32_PhysicalMemory
* Win32_Product
* Win32_BIOS
* Win32_LogicalDisc

## PS-Drives
A PS-Drive is a location to save data. This could be
* directory drives
* registry drives
* certificate drive Cert:
* environment variables (to keep scripts neutral)

Add a new PS-Drive:
```ps
New-PSDrive -Name X -PSProvider FileSystem -Root \\dc01\Share -Persist
```

## Functions & Modules
A module is a package of Cmdlets.

See all available modules: `Get-Module -ListAvailable`

See where the modules are stored: `$env:PSModulePath`
Use the following paths:
* User: C:\Users\jeff\OneDrive\Documents\WindowsPowerShell\Modules
* All Users: C:\Program Files\WindowsPowerShell\Modules
* System (reserved for Microsoft): C:\system32\WindowsPowerShell\v1.0\Modules

`Get-Module` shows all loaded modules.

* Script Modules have the file extension .psm1.
* Binary Modules are typically written in C#.
* Manifest Files are a description about a module.
* Dynamic Modules are not saved in a file.

See all commands of the module Bitlocker:
```ps
Get-Command -Module Bitlocker
```

Every Cmdlet is part of a module.

### Writing Skript Modules
1. Add a module file, e.g. `Get-Time.psm1`
2. Put the file into a module directory which has the same name as the script and put it into the standard module directory, e.g. `Get-Time`
3. Add a manifest file (optional)

### Writing Functions
```ps
function Find-BigFiles {
  Get-ChildItem -Path C:\Windows -Recurse -File -ErrorAction SilentlyContinue | 
  Sort-Object -Descending -Property Length | 
  Select-Object -First 10 Name,`
  @{Name="MB";Expression={[Math]::round($_.length / 1MB, 0)}}, 
  @{Name="Last Access";Expression={$_.LastAccessTime}}
}
```
#### Parameters
A simple parameter looks like this:
```ps
Param(
  [Parameter(Mandatory=$true, ValueFromPipeline=$true, Position=0)]
  [String[]]
  $ParameterName
)
```
* Mandatory: parameter needs to be specified
* ValueFromPipeline: accepts input from the pipeline
* Position: if the name of the parameter is not specified, it needs to be the xth unnamed command
* String[] specifies the datatype of the parameter
* the parameter can be used as `-ParameterName`

## Creating GUIs
### .NET Core Visual Basic Classes
```ps
Add-Type -AssemblyName Microsoft.VisualBasic
$computer = [Microsoft.VisualBasic.Interaction]::InputBox("Enter a computer name", "Computer")
$test = Test-Connection -ComputerName $computer -Count 1 -ErrorAction SilentlyContinue

If ($test) {
[Microsoft.VisualBasic.Interaction]::MsgBox("Test for $computer successful.", "OKOnly,SystemModal,Information", "Success")
} else {
[Microsoft.VisualBasic.Interaction]::MsgBox("Test for $computer failed.", "OKOnly,SystemModal,Critical", "Error")
}
```

### Windows Forms
```ps
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}
```

## Remoting
### Windows Remote Managmement (WinRM)
WinRM makes it possible to establish a connection to a remote computer.
```ps
$s1, $s2, $s3 = New-PSSession -ComputerName Server01, Server02, Server03
```
```ps
Get-PSSession -ComputerName "Server02"
```
```ps
Enter-PSSession -ComputerName Server01
Enter-PSSession -Session $s1
Enter-PSSession -ComputerName Server01 -Port 90 -Credential user123
```
```ps
Exit-PSSession
```
A session can be deleted with `Remove-PSSession`.

WinRM is on Windows servers per default activated, on Windows clients deactivated.

Invoke a command on a remote computer:
```ps
Invoke-Command -Session (Get-PSSession) -ScriptBlock {Test-Connection -ComputerName Server02 -Count 1}
```

## Scheduled Tasks
```ps
$Action=New-ScheduledTaskAction -Execute `
"powershell -Argument –Noprofile -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\Temp\script.ps1"
$Trigger=New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 15)
$Set=New-ScheduledTaskSettingsSet
$Principal=New-ScheduledTaskPrincipal -UserId sid-500\administrator
$Task=New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Set -Principal $Principal
Register-ScheduledTask -TaskName "Test DCs" -InputObject $Task -Force
```

## Jobs
```ps
$job = Start-Job -ScriptBlock {Get-WindowsFeature | Where-Object InstallState -EQ 'Installed' |
Format-Table Name,Installed}
Start-Sleep -Seconds 10
$job | Receive-Job -Keep

```
