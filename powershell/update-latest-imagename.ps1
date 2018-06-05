Param(
    [string]$newimagename
)

#update latest-imagename.txt
Write-Output "New Image name: $newimagename"
$newimagename | Out-File -FilePath 'latest-imagename.txt' -Force