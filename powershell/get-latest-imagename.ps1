$name = (Get-AzureRmResource -ODataQuery "`$filter=tagname eq 'version' and tagvalue eq 'latest'").Name

Write-Host "##vso[task.setvariable variable=latestimagename]$name"
Write-host $env:latestimagename