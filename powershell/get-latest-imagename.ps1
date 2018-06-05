$name = Get-Content .\latest-imagename.txt -Raw
$name = $name.Trim()
Write-Host "##vso[task.setvariable variable=latestimagename]$name"