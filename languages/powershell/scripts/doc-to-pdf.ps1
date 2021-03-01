$wdFormatPDF = 17 
$word = New-Object -ComObject word.application 
$word.visible = $false 
$convert = "C:\Skripts\*" 
$Types = "*.docx","*doc" 
Get-ChildItem -path $convert -include $Types | 
foreach-object { 
  $path =  ($_.fullname).substring(0,($_.FullName).lastindexOf(".")) 
  "Converting files in the $path directory to PDF..." 
  $doc = $word.documents.open($_.fullname) 
  $doc.saveas([ref] $path, [ref]$wdFormatPDF) 
  $doc.close() 
} 
$word.Quit() 
