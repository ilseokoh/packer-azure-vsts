$name = Get-Content .\latest-imagename.txt -Raw 
Write-Host "##vso[task.setvariable variable=latestimagename]$name"